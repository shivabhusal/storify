# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  number           :string
#  total            :float
#  total_tax        :float
#  status           :integer
#  adjustment_total :float
#  completed_at     :datetime
#  payment_status   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Order < ApplicationRecord

  has_many :line_items
  has_many :products, through: :line_items

  enum payment_status: [:pending, :paid]
  enum status: [:undelivered, :delivered]

  after_commit :update_amounts, on: [:create, :update], if: -> {@needs_to_update_total}
  before_create :assign_order_number

  validates_uniqueness_of :number
  validates_presence_of :number

  private

  def update_amounts
    @needs_to_update_total = false
    self.total = self.line_items.total_amount
    self.save
  end

  def assign_order_number
    begin
      self.number = Storify::Randomizer::order_number
    end while self.class.find_by_number(self.number)

    @needs_to_update_total = true
  end

  class << self
    def random_number
      SecureRandom.hex(3)
    end
  end
end
