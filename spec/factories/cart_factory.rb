FactoryBot.define do
  factory :cart do
    subtotal 34.2
    shipping 1.0
    total 35.2
    #cart_status_id 1
    #user_id { User.first.id }
  end
end