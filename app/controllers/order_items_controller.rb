class OrderItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def create
    @order_item = @cart.order_items.find_by(product_id: params[:order_item][:product_id])
    if @order_item
      @order_item.quantity += params[:order_item][:quantity].to_i
      @order_item.save
    else
      @order_item = @cart.order_items.create(order_item_params)
    end
    @cart.save
    session[:cart_id] = @cart.id    
    return redirect_to cart_path(@cart), notice: 'Success' if @cart.save
  end

  def update
    @order_item = @cart.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @cart.order_items
    redirect_to cart_path(@cart)
  end

  def destroy
    @order_item = @cart.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @cart.order_items
    redirect_to cart_path(@cart)
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end