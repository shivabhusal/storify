class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.order(created_at: :desc).page(params[:page])
  end

  def show
    @cart.cart_items.build
    @product = Product.friendly.find(params[:id])
  end

  def search
    range       = params[:price] && params[:price].split(',').map { |x| x.to_f }
    @categories = Category.all
    @products   = Product.solr_search do
      fulltext params[:q]
      with(:selling_price).between(range[0]..range[1]) if params[:price].present?
      with(:categories, params['search-categories']&.map(&:to_i)) if params['search-categories'].present?

      paginate :page => params[:page], :per_page => Product::PerPage
    end.results

    render :index
  end
end
