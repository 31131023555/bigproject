Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root 'products#index'
end
