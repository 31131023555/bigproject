require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:cart) { create(:cart) }

  describe '#show' do
    it 'render show view' do
      get :show, params: { id: cart.id }
      expect(response).to render_template :show
    end

    it 'show right selected cart' do
      get :show, params: { id: cart.id }, session: { cart_id: cart.id }
      expect(assigns(:cart)).to eq cart
    end
  end
end