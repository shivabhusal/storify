require 'rails_helper'
RSpec.describe CartsController, type: :controller do
  describe '#checkout' do
    context 'Success' do
      let(:customer) {create(:customer, authy_status: 'authorized')}
      let(:product1) { create(:product) }
      let(:product2) { create(:product) }

      let(:cart_item1) { create(:cart_item, product_id: product1.id) }
      let(:cart_item2) { create(:cart_item, product_id: product2.id) }
      let(:cart) { create(:cart, cart_items: [cart_item1, cart_item2]) }

      it 'should convert the carts into order items' do
        sign_in(customer)
        @request.session[:cart_id] = cart.id
        # binding.pry
        post :checkout
        expect(Order.count).to eq(1)
        expect(LineItem.count).to eq(2)
      end

      it 'should delete the carts' do
        sign_in(customer)
        @request.session[:cart_id] = cart.id
        # binding.pry
        post :checkout
        expect(Cart.count).to eq(0)
        expect(CartItem.count).to eq(0)
      end

      it 'should set flash message and redirect to root' do
        sign_in(customer)
        @request.session[:cart_id] = cart.id
        post :checkout
        expect(response).to redirect_to(cart_path)
        expect(flash[:notice]).to be_truthy
      end
    end
  end
end
