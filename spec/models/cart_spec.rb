require 'rails_helper'

RSpec.describe Cart, type: :model do
  let!(:category) { create(:category) }
  let!(:cart) { create(:cart) }
  let!(:product1) { create(:product) }
  let!(:product2) { create(:product, price: 4.5) }
  let!(:order_item1) { create(:order_item) }
  let!(:order_item2) { create(:order_item, product_id: 2)}
  context 'validations' do
    it 'set cart status to in progress when creating' do
      expect(cart.cart_status_id).to eq 1
    end

    it 'calculate subtotal' do
      cart.reload
      expect(cart.subtotal).to eq order_item1.total_price+order_item2.total_price
    end
  end

  context 'associations' do
    it { should have_many(:order_items) }
    it { should belong_to(:cart_status) }
    it { should belong_to(:user) }
  end
end