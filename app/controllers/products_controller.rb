class ProductsController < ApplicationController
	def index
		@categories = Category.includes(:products).all
	end

	def show
		@product = Product.find(params[:id])
	end
end