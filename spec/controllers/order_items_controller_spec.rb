require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  #let!(:user) { create(:user) }  
  let!(:cart) { create(:cart) }
  let!(:cart2) { create(:cart, shipping: 2.0) }
  let!(:category) { create(:category) }
  let!(:product) { create(:product) }
  let!(:product2) { create(:product, title: 'hihi') }
  let!(:order_item) { create(:order_item) }
  #let!(:order_item2) { create(:order_item, quantity: 5, cart_id: 2) }

  # def sign_in(user = double('user'))
  #   allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  #   allow(controller).to receive(:current_user).and_return(user)
  # end

  describe '#create' do
    def do_request      
      post :create, params: { order_item: params }, session: { cart_id: cart2.id }
    end

    let!(:params) { attributes_for(:order_item) }
    it 'save order item' do
      expect { do_request }.to change(OrderItem, :count).by(1)
      #expect(order_item).to eq 1
    end

    it 'update quantity' do
      post :create, params: { order_item: params }, session: { cart_id: cart.id }
      expect(order_item.quantity).to eq 2
    end

    it 'redirect to cart' do
      do_request
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