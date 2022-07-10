require 'rails_helper'

RSpec.describe 'Brand Cards Index' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
    @card_4 = @brand_2.cards.create!(player_name: 'Stephen Curry', description: 'Green Swirl', graded: false, value: 92.00)
  end
    # User Story 5, Parent Children Index
      # As a visitor
      # When I visit '/parents/:parent_id/child_table_name'
      # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'shows each card and all attributes of card associated with a brand' do
   visit "/brands/#{@brand_1.id}/cards"

   expect(page).to have_content(@card_1.player_name)
   expect(page).to have_content(@card_1.description)
   expect(page).to have_content(@card_1.graded)
   expect(page).to have_content(@card_1.value)
   expect(page).to have_content(@card_1.created_at)
   expect(page).to have_content(@card_1.updated_at)
   expect(page).to have_content(@card_2.player_name)
   expect(page).to have_content(@card_2.description)
   expect(page).to have_content(@card_2.graded)
   expect(page).to have_content(@card_2.value)
   expect(page).to have_content(@card_2.created_at)
   expect(page).to have_content(@card_2.updated_at)
   expect(page).to have_content(@card_3.player_name)
   expect(page).to have_content(@card_3.description)
   expect(page).to have_content(@card_3.graded)
   expect(page).to have_content(@card_3.value)
   expect(page).to have_content(@card_3.created_at)
   expect(page).to have_content(@card_3.updated_at)

   expect(page).to_not have_content(@brand_2.name)
   expect(page).to_not have_content(@card_4.player_name)
   expect(page).to_not have_content(@card_4.description)
   # expect(page).to_not have_content(@card_4.graded)
   expect(page).to_not have_content(@card_4.value)
   # expect(page).to_not have_content(@card_4.created_at)
   # expect(page).to_not have_content(@card_4.updated_at)
 end
 # User Story 8, Child Index Link
   # As a visitor
   # When I visit any page on the site
   # Then I see a link at the top of the page that takes me to the Child Index
 it 'has link to card index' do
   visit "/brands/#{@brand_1.id}/cards"
   expect(page).to have_link('Cards Index')
   click_link 'Cards Index'
   expect(current_path).to eq('/cards')
   # save_and_open_page
 end
end
