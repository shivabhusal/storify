class DeviseOverride::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    cart_id = session[:cart_id]
    super
    session[:cart_id] = cart_id
  end
end
