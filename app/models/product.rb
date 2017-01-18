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
#  owner_id         :integer
#  payload          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
  has_many :product_categories
  has_many :categories, through: :product_categories
  enum status: [:draft, :published]
  mount_uploader :payload, ProductUploader
  store :metadata, accessors: [:isbn, :author]
end
