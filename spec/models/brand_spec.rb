require 'rails_helper'

RSpec.describe Brand, type: :model do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
  end
  describe 'relationships' do
    it {should have_many(:cards) }
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:year)}
    it {should allow_value(true).for(:sold_at_retail)}
    it {should allow_value(false).for(:sold_at_retail)}
  end

  describe 'methods' do
    it 'orders the brands by most recent first' do

      expect(Brand.sort_by_new.first.id).to eq(@brand_3.id)
      expect(Brand.sort_by_new.last.id).to eq(@brand_1.id)
    end  
  end
end
