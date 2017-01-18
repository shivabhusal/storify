class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def show
    @product = Product.first
  end

end
