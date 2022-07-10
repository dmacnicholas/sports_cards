require 'rails_helper'

RSpec.describe 'Cards Index' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
    # User Story 3, Child Index
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'shows the name of each card and attributes on the index page' do
      visit '/cards'

      expect(page).to have_content(@card_1.player_name)
      expect(page).to have_content(@card_1.description)
      expect(page).to have_content(@card_1.graded)
      expect(page).to have_content(@card_1.value)
      expect(page).to have_content(@card_2.player_name)
      expect(page).to have_content(@card_2.description)
      expect(page).to have_content(@card_2.graded)
      expect(page).to have_content(@card_2.value)
      expect(page).to have_content(@card_3.player_name)
      expect(page).to have_content(@card_3.description)
      expect(page).to have_content(@card_3.graded)
      expect(page).to have_content(@card_3.value)
    end
    # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it 'has link to card index' do
        visit '/cards'
        expect(page).to have_link('Cards Index')
        click_link 'Cards Index'
        expect(current_path).to eq('/cards')
        # save_and_open_page
    end
end
