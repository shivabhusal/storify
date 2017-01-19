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
#  metadata         :jsonb
#  available_from   :datetime
#  available_upto   :datetime
#  selling_price    :float
#  cost_price       :float
#  tax_rate         :float
#  status           :integer
#  owner_id         :integer
#  payload          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :product do
    sku { SecureRandom::hex(3) }
    name { Faker::Book.title }
    tax_rate { 12 }
  end
end
