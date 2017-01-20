class CartsController < ApplicationController
  skip_before_action :authenticate_user!

  def show

    # render js: "document.location='#{request.referrer}'"
  end

  def create
    session[:cart_id] = Cart.create(cart_params).id
    redirect_to :back
  end

  def update
    cart = Cart.find(session[:cart_id])
    cart.update(cart_params)
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

  def checkout
    # Generate Order and Line Items from Cart and CartItems
    # Delete Cart and CartItems
    line_items = @cart.cart_items.map do |cart_item|
      LineItem.create({ product_id: cart_item.product_id })
    end

    if Order.create(line_items: line_items)
      flash[:notice] = 'You have successfully order the items in cart'
      @cart.destroy
    else
      flash[:error] = 'Could not complete the operation due to some error'
    end

    redirect_back fallback_location: root_path
  end

  private

  def cart_params
    params.require(:cart).permit(cart_items_attributes: [:product_id])
  end
end

