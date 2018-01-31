require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	let!(:category1) { create(:category) }
	let!(:category2) { create(:category, title: 'Marshall') }
	let!(:category3) { create(:category, title: 'Barney') }

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
end