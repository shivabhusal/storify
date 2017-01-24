# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it {should belong_to :product}
  it {should belong_to :cart}

  let(:product1) { create(:product, selling_price: 100, tax_rate: 1.0) }
  let(:product2) { create(:product, selling_price: 100, tax_rate: 1.0) }

  let(:cart_item1) { create(:cart_item, product_id: product1.id) }
  let(:cart_item2) { create(:cart_item, product_id: product2.id) }
  let(:cart) { create(:cart, cart_items: [cart_item1, cart_item2]) }

  describe '.total_amount' do
    it 'should return the sum of selling_price of individual product' do
      expect(cart.cart_items.total_amount).to eq(product1.selling_price + product2.selling_price)
    end
  end

  describe '.total_tax_amount' do
    it 'should return the sum of selling_price of individual product' do
      expected_tax_amount = [product1, product1].sum{|x| x.selling_price*x.tax_rate/100.0}
      expect(cart.cart_items.total_tax_amount).to eq(expected_tax_amount)
    end
  end
end
