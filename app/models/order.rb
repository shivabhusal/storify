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
end
