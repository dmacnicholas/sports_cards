require 'rails_helper'

RSpec.describe Card, type: :model do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
    @card_4 = @brand_2.cards.create!(player_name: 'Stephen Curry', description: 'Green Swirl', graded: false, value: 92.00)
  end
  describe 'relationships' do
    it {should belong_to :brand}
  end

  describe 'validations' do
    it {should validate_presence_of(:player_name)}
    it {should validate_presence_of(:description)}
    it {should allow_value(true).for(:graded)}
    it {should allow_value(false).for(:graded)}
    it {should validate_presence_of(:value)}
  end

  describe 'methods' do
    it 'only shows cards that are graded ' do

    expect(Card.all.length).to eq(4)
    expect(Card.show_graded_cards.length).to eq(2)
    end
  end

end
