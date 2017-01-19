class ApplicationController < ActionController::Base
  # Note: Any before_action declared here must be skipped via active_admin.rb

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_categories
  before_action :set_cart
  private

  def set_categories
    @categories = Category.master
  end

  def set_cart
    @cart = Cart.find_or_initialize_by(id: session[:cart_id])
  end

end
