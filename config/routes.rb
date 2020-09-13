Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:new, :create]
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]

end
