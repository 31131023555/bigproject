class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart
  before_action :get_category
  layout :get_layout
  # private
  # def current_cart
  #   @cart = Cart.find(cookies[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   cookies[:cart_id] = @cart.id
  # end  
    
  private
  def current_cart
    if !user_signed_in?
      if !session[:cart_id].nil?
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    else
      if current_user.carts.length > 0
        @cart = current_user.carts.first
      else
        @cart = Cart.find(session[:cart_id])
        @cart.update(user_id: current_user.id)
      end
    end    
  end

  def get_category
    @categories = Category.all
  end

  def get_layout
    user_signed_in? ? 'login' : 'application'
  end
end
