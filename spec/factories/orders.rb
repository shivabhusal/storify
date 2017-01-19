# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  number           :string
#  total            :float
#  total_tax        :float
#  status           :integer          default("0")
#  adjustment_total :float
#  completed_at     :datetime
#  payment_status   :integer          default("0")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :order do
    number { Storify::Randomizer.order_number}
  end
end
