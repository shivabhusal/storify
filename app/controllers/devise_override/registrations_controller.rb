class DeviseOverride::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :validate_type_field, only: [:create, :update]

  private
  def validate_type_field
    # if Base64.decode64(params['user']['type']).in? ['VehicleOwner', 'GarageOwner']
    #   params['user']['type'] = Base64.decode64(params['user']['type'])
    # else
    #   flash[:error] = 'Invalid User type selected, please select a valid one.'
    #   redirect_to :back
    # end

    params[:user][:type] = 'Customer'
  end
end
