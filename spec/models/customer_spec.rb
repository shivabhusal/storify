# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string
#  country_code            :string
#  phone_number            :string
#  first_name              :string
#  last_name               :string
#  gender                  :string
#  avatar                  :string
#  metadata                :jsonb            default("{}")
#  type                    :string
#  status                  :integer          default("0")
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default("0"), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  unconfirmed_email       :string
#  failed_attempts         :integer          default("0"), not null
#  unlock_token            :string
#  locked_at               :datetime
#  authy_id                :string
#  authy_status            :string
#  last_sign_in_with_authy :datetime
#  authy_enabled           :boolean          default("false")
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:orders).with_foreign_key(:user_id) }

  it { should have_many(:carts).with_foreign_key(:user_id)}
  it { should have_many(:orders).with_foreign_key(:user_id) }

  describe '#customer?' do
    let(:customer) { build :customer }
    let(:admin) { build :admin }

    it 'should return true for customer' do
      expect(customer.customer?).to eq(true)
    end

    it 'should return false for non-customer' do
      expect(admin.customer?).to eq(false)
    end
  end

end
