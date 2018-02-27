FactoryBot.define do
  factory :user do
    email 'test@example.com'
    password 'hihihi'
    confirmed_at Date.today
    # if needed
    # is_active true
  end
end