class ProductsController < ApplicationController
	def index
		@categories = Category.includes(:products).all
    #@order_item = current_cart.order_items.new
	end

	def show
		@product = Product.find(params[:id])    
    @order_item = current_cart.order_items.new
	end
end