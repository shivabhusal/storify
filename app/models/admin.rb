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

class Admin < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    true
  end

end
