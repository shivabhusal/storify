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
    collection { post :checkout }
  end

  resources :products do
    collection { get :search }
  end
end
