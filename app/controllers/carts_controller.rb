class CartsController < ApplicationController
  def show
    @order_items = @cart.order_items.reverse
  end
end