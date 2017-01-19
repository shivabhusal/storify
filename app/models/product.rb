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

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :pictures, as: :imageable

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :line_items
  has_many :orders, through: :line_items

  has_many :cart_items
  has_many :carts, through: :cart_items

  enum status: [:draft, :published]
  mount_uploader :payload, ProductUploader
  store :metadata, accessors: [:isbn, :author, :publisher, :genre]

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
        :name,
        [:name, :sku]
    ]
  end
end
