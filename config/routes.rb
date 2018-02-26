Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'transactions/new'

  devise_for :users
  resources :products, only: [:index, :show]
  resources :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :show]
  # resources :transactions, only: [:new, :show, :create]
  # resources :payments do
  #   collection do
  #     get :success
  #     get :cancel
  #     post :notify
  #     get :close_popup
  #   end
  # end
  # post '/order/:id' => 'order#show'
  # post '/hook' => 'order#hook'
  root 'products#index'
end
