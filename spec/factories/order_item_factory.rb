FactoryBot.define do
  factory :order_item do
    unit_price 5.5
    quantity 2
    total_price 11.0
    product_id { Product.last.id }
    cart_id { Cart.last.id }
  end
end