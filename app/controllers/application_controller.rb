class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart

  private
  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
