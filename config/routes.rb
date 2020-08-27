Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create]
  get 'users/user_sign_up', to: 'users#new'
end
