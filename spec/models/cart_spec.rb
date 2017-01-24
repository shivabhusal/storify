# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :integer
#  metadata   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do

  it { should have_many :cart_items }
  it { should have_many :products }
  it { should accept_nested_attributes_for :cart_items }

  context 'update total amount and taxes' do
    let(:product1) { create(:product, selling_price: 123.0, tax_rate: 5) }
    let(:product2) { create(:product, selling_price: 10.0, tax_rate: 1.0) }
    let(:cart_item1) { create(:cart_item, product: product1) }
    let(:cart_item2) { create(:cart_item, product: product2) }
    let(:cart) { create(:cart, cart_items: [cart_item1, cart_item2]) }

    it 'should update total amount before commit' do
      expect(cart.reload.total).to eq(product1.selling_price + product2.selling_price)
    end

    it 'should update total tax amount before commit' do
      expect(cart.reload.total_tax).to eq((product1.tax_rate/100.0)*product1.selling_price + (product2.tax_rate/100.0)*product2.selling_price)
    end
  end
end
