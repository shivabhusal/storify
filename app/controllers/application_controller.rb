class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  # Note: Any before_action declared here must be skipped via active_admin.rb

  include ExceptionHandler

  before_action :authenticate_user!
  before_action :set_categories
  before_action :set_cart

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_categories
    @categories = Category.master
  end

  def set_cart
    @cart = Cart.find_or_initialize_by(id: session[:cart_id])
  end

  def configure_permitted_parameters
    # Some override has been done in DeviseOverride::RegistrationsController
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:email,
                                             :first_name,
                                             :last_name,
                                             :gender,
                                             :avatar,
                                             :password,
                                             :password_confirmation,
                                             :country_code,
                                             :phone_number,
                                             :type])

  end

  def authenticate_only_customer!
    unless current_user&.customer?
      raise UnAuthorized
    end
  end

end
