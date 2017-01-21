# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  country_code           :string
#  phone_number           :string
#  authy_id               :string
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  avatar                 :string
#  metadata               :jsonb            default("{}")
#  type                   :string
#  status                 :integer          default("0")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable,
         :lockable, :timeoutable

  validates_presence_of :email, :phone_number, :gender, :country_code
  validates :email, format: {with: Config::VALID_EMAIL_REGEX}
  validates_uniqueness_of :email, :phone_number

  mount_uploader :avatar, AvatarUploader
  enum status: [:active, :inactive]

  def admin?
    false
  end

  def customer?
    false
  end
end
