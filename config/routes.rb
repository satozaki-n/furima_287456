Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:new, :create, :destroy]
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
 
end
