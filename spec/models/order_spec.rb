# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  number           :string
#  total            :float
#  total_tax        :float
#  status           :integer          default("0")
#  adjustment_total :float
#  completed_at     :datetime
#  payment_status   :integer          default("0")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_uniqueness_of(:number) }
  it { should have_many :line_items }
  it { should have_many :products }
  it { should define_enum_for :status }
  it { should define_enum_for :payment_status }

  describe 'assign_order_number' do
    let(:order) { create(:order) }
    it 'should set an unique 6 digits order number' do
      expect(order.number).to be_a(String)
      expect(order.number.length).to be 6
    end
  end

  context 'update total amount and taxes' do
    let(:product1) { create(:product, selling_price: 123.0, tax_rate: 5) }
    let(:product2) { create(:product, selling_price: 10.0, tax_rate: 1.0) }
    let(:line_item1) {create(:line_item, product: product1, quantity: 2)}
    let(:line_item2) {create(:line_item, product: product2, quantity: 1)}
    let(:order) { create(:order, line_items:[line_item1, line_item2]) }

    it 'should update total amount before commit' do
      expect(order.reload.total).to eq(product1.selling_price*2 + product2.selling_price)

    end
    it 'should update total tax amount before commit' do
      expect(order.reload.total_tax).to eq((product1.tax_rate/100.0)*product1.selling_price*2 + (product2.tax_rate/100.0)*product2.selling_price*1)

    end
  end
end
