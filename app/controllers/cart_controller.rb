class CartController < ApplicationController
  def index

  end

  def create

  end

  def update

  end

  private

    def cart_params
      params.require(:cart).permit(:user_id, :status, :metadata)
    end
end

