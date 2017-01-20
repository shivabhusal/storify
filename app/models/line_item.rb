# == Schema Information
#
# Table name: line_items
#
#  id               :integer          not null, primary key
#  quantity         :integer          default("1")
#  product_id       :integer
#  order_id         :integer
#  adjustment_total :float
#  price            :float
#  metadata         :jsonb            default("{}")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  scope :total_amount, -> { joins(:product).sum('products.selling_price*line_items.quantity')}
  scope :total_tax_amount, -> { joins(:product).sum('products.selling_price*(products.tax_rate/100.0)*line_items.quantity')}
end
