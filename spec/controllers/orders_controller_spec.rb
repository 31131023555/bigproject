require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end
  let!(:cart) { create(:cart) }

  describe '#new' do
    it 'render new view' do      
      get :new
      expect(response).to render_template :new
    end

    it 'get new order' do
      get :new
      expect(assigns(:order)).to be_a(Order)
    end
  end

  describe '#create' do
    def do_request
      post :create, params: { order: params }, session: { cart_id: cart.id }
    end

    context 'with valid params' do
      let!(:params) { attributes_for(:order) }
      it 'save order' do
        expect { do_request }.to change(Order, :count).by(1)
      end

      it 'redirect to order invoice' do
        do_request
        expect(response).to redirect_to order_path(assigns(:order))
      end
    end

    context 'with invalid params' do
      let!(:params) { attributes_for(:order, delivery_address: ' ') }
      it 'does not save order' do 
        expect { do_request }.to_not change(Order, :count)
      end
    end
  end

  describe '#show' do
    let!(:order) { create(:order) }
    it 'show right selected order' do 
      get :show, params: { id: order.id }
      expect(assigns(:order)).to eq order
    end

    it 'render show view' do 
      get :show, params: { id: order.id }
      expect(response).to render_template :show
    end
  end
end