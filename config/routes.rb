Rails.application.routes.draw do
  devise_for :users,
             :controllers => { registrations: 'devise_override/registrations' },
             :path_names  => {
                 :verify_authy              => "/verify-token",
                 :enable_authy              => "/enable-two-factor",
                 :verify_authy_installation => "/verify-installation"
             }

  ActiveAdmin.routes(self)

  root 'products#index'
  # --------------------------------------

  resource :cart do
    member { delete :destroy }
    collection do
      post :checkout
      post :pre_checkout
    end
  end

  resources :products do
    collection { get :search }
  end

  resources :orders
  get '/profile', to: 'profile#show'
  post "authy/callback"
  get "authy/status" => 'authy#one_touch_status'
  post "authy/send_token_via_sms"
  post "authy/verify"
end
