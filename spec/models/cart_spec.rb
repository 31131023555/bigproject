require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'validations' do

  end

  context 'associations' do
    it { should have_many(:order_items) }
    it { should belong_to(:cart_status) }
  end
end