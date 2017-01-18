# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  description :string
#  metadata    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id
  has_many :children, class_name: 'Category', foreign_key: :parent_id

  scope :master, -> { where(parent_id: nil) }
  scope :children, -> { where.not(parent_id: nil) }
end
