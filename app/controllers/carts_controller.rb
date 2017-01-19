class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  def show

    # render js: "document.location='#{request.referrer}'"
  end

  def create
    session[:cart_id] = cart.id if cart = Cart.create(cart_params)
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
  end

  private

    def cart_params
      params.require(:cart).permit(cart_items_attributes: [:product_id])
    end
end

