# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  sku              :string
#  meta_title       :string
#  meta_tags        :string
#  meta_description :text
#  tags             :string
#  metadata         :jsonb            default("{}")
#  available_from   :datetime
#  available_upto   :datetime
#  selling_price    :float
#  cost_price       :float
#  tax_rate         :float            default("0.0")
#  status           :integer          default("0")
#  owner_id         :integer
#  payload          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it {should have_many :line_items}
  it {should have_many :orders}
  it {should have_many :pictures}
end
