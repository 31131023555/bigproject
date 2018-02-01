require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:category1) { create(:category) }
  let!(:category2) { create(:category, title: 'Marshall') }
  let!(:category3) { create(:category, title: 'Barney') }
  let!(:product) { create(:product) }

  describe '#index' do
    it 'render index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'get a list of categories' do
      categories = [category1, category2, category3]
      get :index
      expect(assigns(:categories)).to eq categories
    end
  end

  describe '#show' do
    it 'render show view' do
      get :show, params: { id: product.id }
      expect(response).to render_template :show
    end

    it 'show right selected product' do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq product
    end
  end
end