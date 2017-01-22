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

FactoryGirl.define do
  factory :customer do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    country_code { ['1', '977', '61'].sample }
    phone_number { Faker::PhoneNumber.cell_phone }
    gender { ['male', 'female'].sample }
  end
end
