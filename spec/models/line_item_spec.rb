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
#  metadata         :jsonb            default("{}")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it {should belong_to :order}
  it {should belong_to :product}
end
