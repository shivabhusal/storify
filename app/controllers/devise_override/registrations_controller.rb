class DeviseOverride::RegistrationsController < Devise::RegistrationsController
  before_action :validate_type_field, only: [:create, :update]

  private
  def validate_type_field
    params[:user][:type] = 'Customer'
  end
end
