require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let!(:cart) { create(:cart) }
  let!(:category) { create(:category) }
  let!(:product) { create(:product) }
  let!(:order_item) { create(:order_item) }

  describe '#create' do
    def do_request
      post :create, params: { order_item: params }, session: { cart_id: cart.id}
    end

    let!(:params) { attributes_for(:order_item) }
    it 'save order item' do
      expect { do_request }.to change(OrderItem, :count).by(1)
    end

    it 'redirect to cart' do
      do_request
      expect(response).to redirect_to cart_path(cart)
    end
  end  

  describe '#update' do
    def do_request
      put :update, params: { order_item: params, id: order_item.id }, session: { cart_id: cart.id}
    end

    let!(:params) { attributes_for(:order_item, quantity: 3) }
    it 'update to database' do
      do_request
      order_item.reload
      expect(order_item.quantity).to eq 3
    end
  end

  describe '#destroy' do
    def do_request
      delete :destroy, params: { id: order_item.id }, session: { cart_id: cart.id}
    end

    it 'delete order item in database' do
      expect { do_request }.to change(OrderItem, :count).by(-1)
    end
  end
end