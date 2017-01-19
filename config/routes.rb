Rails.application.routes.draw do
  # devise_for :admins, ActiveAdmin::Devise.config
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  authenticate :user, ->(user) { user.admin? } do
    root 'admins/dashboard#index'
  end
  ActiveAdmin.routes(self)

  resources :products
end
