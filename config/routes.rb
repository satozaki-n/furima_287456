Rails.application.routes.draw do
  
  #user
  devise_for :users
  resources :users, only: [:new, :create, :destroy]
  get 'users/user_sign_up', to: 'users#new'

  #item
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]
  get 'items/index'
  get 'items/new_item', to: 'items#new'
  post 'items/new', to: 'items#create'


end
