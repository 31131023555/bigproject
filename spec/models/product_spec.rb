require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    let!(:category) { create(:category) }
    let!(:product1) { create(:product, description: 
      '&lt;p&gt;This is description&lt;/p&gt;') }
    let!(:product2) { create(:product, description: 
      '<p>This is description</p>') }
    let!(:product3) { build(:product, description: 'Short') }
    let!(:product4) { build(:product, price: 0) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:imgurl) }

    it 'There are not decoding HTML entities in description' do
      expect(product1.description).to eq 'This is description'
    end

    it 'There are not  HTML in description' do
      expect(product2.description).to eq 'This is description'
    end

    it 'Title must be shorter than description' do
      product3.validate
      expect(product3.errors.messages).to include(title: [
        'Title must be shorter than description'])
    end

    it 'Price must be greater than 0' do
      product4.validate
      expect(product4.errors.messages).to include(price: [
        'must be greater than 0'])
    end
  end

  context 'associations' do
    it {should belong_to(:category) }
  end
end