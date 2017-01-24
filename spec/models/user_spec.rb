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

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :country_code }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  describe 'Email format Validation' do
    let(:valid_user) { build(:user, email: 'asd@example.com') }
    let(:invalid_user) { build(:user, email: 'asd@examplecom') }

    context 'Valid' do
      it 'should mark valid_user as valid' do
        expect(valid_user.valid?).to eq(true)
      end
    end

    context 'Invalid' do
      it 'should mark invalid_user as invalid' do
        expect(invalid_user.valid?).to eq(false)
      end
    end

    it 'should have enum for :status' do
      expect(User.statuses.keys).to eq(['active', 'inactive'])
    end
  end

  it 'is not admin yet' do
    expect(User.new.admin?).to eq(false)
  end

  it 'is not Customer yet' do
    expect(User.new.customer?).to eq(false)
  end

  describe '#full_name' do
    let(:user) { build(:user) }
    it 'should compile fullname from name parts' do
      expect(user.full_name).to eq([user.first_name, user.last_name].join(' '))
    end
  end

  describe 'after_save#update_authy_id' do
    let(:user) { create(:user) }
    it 'should auto update the authy_id just after record is created' do
      expect(user.authy_id).to be_truthy
    end

    it 'should auto update the authy_id just after phone_number is updated' do
      old_authy_id = user.authy_id
      user.update(first_name: 'New updated name', phone_number: '3779345998')
      expect(user.reload.authy_id).not_to eq(old_authy_id)
    end

    it 'should auto update the authy_id just after country_code is updated' do
      old_authy_id = user.authy_id
      user.update(first_name: 'New updated name', country_code: '91')
      expect(user.reload.authy_id).not_to eq(old_authy_id)
    end

    it 'should not update the authy_id if no change in country_code or phone_number' do
      old_authy_id = user.authy_id
      user.update(first_name: 'New updated name')
      expect(user.reload.authy_id).to eq(old_authy_id)
    end
  end
end
