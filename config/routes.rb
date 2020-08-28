Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create]
  resources :items, only: [:index, :new, :create]
  get 'items/index'
  get 'items/new_item', to: 'items#new'
  get 'users/user_sign_up', to: 'users#new'
end
