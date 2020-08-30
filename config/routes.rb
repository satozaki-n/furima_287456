Rails.application.routes.draw do
  
  #user
  devise_for :users
  resources :users, only: [:new, :create]
  get 'users/user_sign_up', to: 'users#new'

  #item
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  get 'items/index'
  get 'items/new_item', to: 'items#new'

end
