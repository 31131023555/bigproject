class OrdersController < ApplicationController
  protect_from_forgery except: [:hook]
  before_action :authenticate_user!
  #skip_before_action :current_cart, only: [:new]
  def new 
    @user = current_user
    gon.client_token = generate_client_token
    @order = Order.new
  end

  def create
    @user = current_user
    @order = Order.new(order_params)        
    @result = Braintree::Transaction.sale(
              amount: @cart.total,
              payment_method_nonce: 'fake-valid-nonce') #params[:payment_method_nonce]
    if @result.success?
      @cart.update_attributes(cart_status_id: 2) 
      session[:cart_id] = nil
      if @order.save
        AcotsMailer.transaction_email(@order).deliver
        redirect_to order_path(@order), notice: "Congratulations! Your transaction has been successfully!"
      end
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @oldcart = Cart.find(@order.cart_id)
  end

  # def hook
  #   params.permit!
  #   status = params[:payment_status]
  #   if status == 'Completed'
  #     @order = Order.find params[:invoice]
  #     @order.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
  #   end
  #   render nothing: true
  # end

  private
  def order_params
    params.require(:order).permit(:delivery_address, :purchased_at, :cart_id, :user_id)
  end

  def generate_client_token
    Braintree::ClientToken.generate
  end
end