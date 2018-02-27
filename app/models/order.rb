class Order < ApplicationRecord
  validates :delivery_address, presence: true
end