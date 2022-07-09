require 'rails_helper'

RSpec.describe 'Cards Show' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
  # User Story 4, Child Show
   # As a visitor
   # When I visit '/child_table_name/:id'
   # Then I see the child with that id including the child's attributes:
   it 'shows all of the attributes for a card when viewing /card/:id' do
     visit "/cards/#{@card_1.id}"

     expect(page).to have_content(@card_1.player_name)
     expect(page).to have_content(@card_1.description)
     expect(page).to have_content(@card_1.graded)
     expect(page).to have_content(@card_1.value)
     expect(page).to have_content(@card_1.created_at)
     expect(page).to have_content(@card_1.updated_at)

    expect(page).to_not have_content(@card_2.player_name)
  end
end
