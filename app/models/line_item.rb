# == Schema Information
#
# Table name: line_items
#
#  id               :integer          not null, primary key
#  quantity         :integer
#  product_id       :integer
#  adjustment_total :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :product
end
