# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string
#  payload        :string
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
  it {should belong_to :imageable}
end
