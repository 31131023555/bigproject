FactoryBot.define do
  factory :order_item do
    unit_price 5.5
    quantity 2
    total_price { quantity*unit_price }
    product_id { Product.first.id }
    cart_id { Cart.first.id }
  end
end