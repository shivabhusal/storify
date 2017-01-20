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

class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  scope :total_amount, -> {
    joins(:product).sum('products.selling_price')
  }

  scope :total_tax_amount, -> {
    joins(:product).sum('products.selling_price*(products.tax_rate/100.0)')
  }
end
