# == Schema Information
#
# Table name: line_items
#
#  id               :integer          not null, primary key
#  quantity         :integer
#  product_id       :integer
#  order_id         :integer
#  adjustment_total :float
#  price            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :line_item do
    
  end
end
