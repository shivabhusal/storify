class CartsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:checkout, :pre_checkout]
  before_action :authenticate_only_customer!, only: [:checkout]
  before_action :verify_token, only: [:checkout]
  before_action :no_empty_cart!, only: [:checkout, :pre_checkout]

  def show
  end

  def create
    session[:cart_id] = Cart.create(cart_params).id
    flash[:notice] = 'Item added to cart successfully.'
    redirect_to :back
  end

  def update
    cart = Cart.find(session[:cart_id])
    cart.update(cart_params)
    flash[:notice] = 'Item added to cart successfully.'
    redirect_to :back
  end

  def destroy
    cart_item = @cart.items.find(params[:id])
    if cart_item.destroy
      flash[:notice] = 'Item successfully removed from the cart'
    else
      flash[:error] = 'Could not complete the operation due to some error'
    end
    redirect_back fallback_location: root_path
  end

  def pre_checkout
    # Empty the `authy_status` field of current_user
    # Reason: every 2000ms an AJAX call comes to verify the OneTouch Status.
    #  So clearing the garbage from previous sessions.
    current_user.update(authy_status: nil)

    # Try to verify with OneTouch
    Authy::OneTouch.send_approval_request(
        id:      current_user.authy_id,
        message: "Request to verify checkout to Storify app",
        details: {
            'Email Address' => current_user.email,
        }
    )
  end

  def checkout
    # Generate Order and Line Items from Cart and CartItems
    # Delete Cart and CartItems
    line_items = @cart.cart_items.map do |cart_item|
      LineItem.create({ product_id: cart_item.product_id })
    end

    if order = Order.create(user_id: current_user.id, line_items: line_items)
      flash[:notice] = 'You have successfully ordered the items in the cart. Products have been delivedred via Email.'
      @cart.destroy
      CartMailer.deliver(order.id).deliver_now
    else
      flash[:error] = 'Could not complete the operation due to some error'
    end

    redirect_to cart_path
  end

  private

  def verify_token
    if current_user.authy_status.present? || valid_token?
      current_user.update(authy_status: nil)
    else
      flash[:error] = 'Authentication could not be completed. Please try again'
      redirect_back fallback_location: root_path
    end
  end

  def cart_params
    params.require(:cart).permit(cart_items_attributes: [:id, :product_id])
  end

  def valid_token?
    Authy::API.verify(id: current_user.authy_id, token: params[:token]).ok?
  end

  def invalid_token?
    !valid_token?
  end

  def no_empty_cart!
    if @cart.cart_items.empty?
      flash[:error] = 'Please put items into cart before checkout'
      redirect_to root_path
    end
  end
end
