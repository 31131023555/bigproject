require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let!(:cart) { create(:cart) }
  let!(:cart2) { create(:cart, shipping: 2.0) }
  let!(:category) { create(:category) }
  let!(:product) { create(:product) }
  let!(:product2) { create(:product, title: 'hihi') }
  let!(:order_item) { create(:order_item) }

  describe '#create' do
    def do_request1      
      post :create, params: { order_item: params }, session: { cart_id: cart2.id }
    end

    def do_request2
      post :create, params: { order_item: params }, session: { cart_id: cart.id }
    end
    
    let!(:params) { attributes_for(:order_item) }

    context 'add other product' do
      it 'save order item' do
        expect { do_request1 }.to change(OrderItem, :count).by(1)
      end
    end     

    context 'add same product' do
      it 'update quantity' do
        do_request2
        after_quantity = order_item.quantity + params[:quantity].to_i
        order_item.reload
        expect(order_item.quantity).to eq after_quantity
      end
    end
    
    it 'redirect to cart' do
      do_request1
      expect(response).to redirect_to cart_path(cart2)
    end
  end  

  describe '#update' do
    def do_request
      put :update, params: { order_item: params, id: order_item.id }, session: { cart_id: cart.id }
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
      delete :destroy, params: { id: order_item.id }, session: { cart_id: cart.id }
    end

    it 'delete order item in database' do
      expect { do_request }.to change(OrderItem, :count).by(-1)
    end
  end
end