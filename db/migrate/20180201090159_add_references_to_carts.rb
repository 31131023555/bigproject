class AddReferencesToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :cart_status, index: true
    add_reference :order_items, :product, index: true
    add_reference :order_items, :cart, index: true
  end
end
