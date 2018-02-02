class Cart < ApplicationRecord
  belongs_to :cart_status, optional: true
  has_many :order_items
  before_create :set_cart_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity*oi.unit_price) : 0 }.sum
  end
  private
  def set_cart_status
    self.cart_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end