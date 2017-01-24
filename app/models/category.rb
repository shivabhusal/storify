# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  description :string
#  metadata    :jsonb            default("{}")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
  has_many :children, class_name: 'Category', foreign_key: :parent_id

  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id

  scope :master, -> { where(parent_id: nil) }
  scope :children, -> { where.not(parent_id: nil) }

end
