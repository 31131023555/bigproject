require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let!(:cart) { create(:cart) }
  let!(:category) { create(:category) }
  let!(:product) { create(:product) }
  let!(:order_item) { create(:order_item) }
  let!(:order_item1) { build(:order_item, quantity: 0, product_id: 99) }
  let!(:order_item2) { build(:order_item, quantity: 5.5, cart_id: 99) }

  context 'validations' do
    it {should validate_presence_of(:quantity) }
    it 'Quantity should be greater than 0' do
      order_item1.validate
      expect(order_item1.errors.messages).to include(quantity: [
        'must be greater than 0'])
    end
    it 'Quantity must be integer' do
      order_item2.validate
      expect(order_item2.errors.messages).to include(quantity: [
        'must be an integer'])
    end

    it 'Totalprice equals unitprice plus quantity' do
      expect(order_item.total_price).to eq (order_item.unit_price*order_item.quantity)
    end

    it 'Product of orderitem must present' do
      order_item1.validate
      expect(order_item1.errors.messages).to include(product: [
        'is not valid or is not active.'])
    end

    it 'Cart or orderitem must present' do
      order_item2.validate
      expect(order_item2.errors.messages).to include(cart: [
        'is not a valid order.'])
    end
  end

  context 'associations' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end
end