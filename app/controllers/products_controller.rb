class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @cart.cart_items.build
    @product = Product.friendly.find(params[:id])
  end

  def search
    @products = Product.solr_search do
      fulltext params[:q]
    end.results

    render :index
  end
end
