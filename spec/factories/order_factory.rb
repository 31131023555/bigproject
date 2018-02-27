FactoryBot.define do
  factory :order do
    delivery_address 'Ameribilia'
    purchased_at DateTime.now
    cart_id { Cart.first.id }
    user_id { User.first.id } 
  end
end