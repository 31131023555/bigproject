require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end
  let!(:cart) { create(:cart, user_id: 1) }

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
end