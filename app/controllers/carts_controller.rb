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

  private

    def cart_params
      params.require(:cart).permit(cart_items_attributes: [:product_id])
    end
end

