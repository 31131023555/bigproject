class CartsController < ApplicationController
  def show
    #@cart = current_cart
    @order_items = current_cart.order_items.reverse
  end
end