class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_categories
  def index
    @products = Product.all
  end

  def show
    @product = Product.first
  end

  private

  def set_categories
    @categories = Category.master
  end
end
