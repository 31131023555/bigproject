class Cart < ApplicationRecord
  belongs_to :cart_status, optional: true
  belongs_to :user, optional: true
  has_many :order_items
  before_create :set_cart_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity*oi.unit_price) : 0 }.sum
  end

  def shipping
    subtotal < 50.0 ? shipping = 5.0 : 0
  end

  def total
    total = subtotal + shipping
  end

  private
  def set_cart_status
    self.cart_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
    self[:shipping] = shipping
    self[:total] = total
  end
end