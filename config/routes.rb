Rails.application.routes.draw do
  devise_for :users
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
