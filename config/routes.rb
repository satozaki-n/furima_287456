Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :create, :destroy]
  get 'users/user_sign_up', to: 'users#new'
end
