# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :integer
#  metadata   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  belongs_to :customer, foreign_key: :user_id

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  accepts_nested_attributes_for :cart_items
  alias items cart_items

  def total
    cart_items.total_amount
  end
  def total_tax
    cart_items.total_tax_amount
  end
end
