class OrdersController < ApplicationController
  before_action :authenticate_user!
  #skip_before_action :current_cart, only: [:new]
  def new    
    #@cart = current_cart
    @user = current_user
    @order = Order.new
  end
end