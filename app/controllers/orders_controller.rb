class OrdersController < ApplicationController
  def new
    @cart = current_cart
    @order = Order.new
  end
end