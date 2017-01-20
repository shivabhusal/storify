Rails.application.routes.draw do
  resource :cart do
    member do
      delete :destroy
    end

    collection do
      post :checkout
    end
  end
  # devise_for :admins, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  authenticate :user, ->(user) { user.admin? } do
    root 'admins/dashboard#index'
  end
  ActiveAdmin.routes(self)

  resources :products do
    collection do
      get :search
    end
  end
end
