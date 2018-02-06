class OrderItemsController < ApplicationController
  def create
    #@cart = current_cart
    @order_item = @cart.order_items.find_by(product_id: params[:order_item][:product_id])
    if @order_item
      @order_item.quantity += 1
      @order_item.save
    else
      @order_item = @cart.order_items.create(order_item_params)
    end
    @cart.save
    session[:cart_id] = @cart.id    
    return redirect_to cart_path(@cart), notice: 'Success' if @cart.save
  end

  def update
    #@cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @cart.order_items

    respond_to do |f|      
      f.js 
    end
  end

  def destroy
    #@cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @cart.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end