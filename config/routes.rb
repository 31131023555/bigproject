Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new]
  root 'products#index'
end
