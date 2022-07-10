require 'rails_helper'

RSpec.describe 'Brands Show' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
  # User Story 2, Parent Show
   # As a visitor
   # When I visit '/parents/:id'
   # Then I see the parent with that id including the parent's attributes:
   # - data from each column that is on the parent table
  it 'shows all brands ids and attributes' do
    visit "/brands/#{@brand_1.id}"


    expect(page).to have_content(@brand_1.name)
    expect(page).to have_content(@brand_1.year)
    expect(page).to have_content(@brand_1.sold_at_retail)
    expect(page).to have_content(@brand_1.created_at)
    expect(page).to have_content(@brand_1.updated_at)

    expect(page).to_not have_content(@brand_2.name)
  end
  # User Story 7, Parent Child Count
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'shows the amount of cards per brand' do
    visit "/brands/#{@brand_1.id}"

    expect(page).to have_content("Number of Cards: #{@brand_1.cards.count}")
  end
  # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    it 'has link to card index' do
      visit "/brands/#{@brand_1.id}"
      expect(page).to have_link('Cards Index')
      click_link 'Cards Index'
      expect(current_path).to eq('/cards')
      # save_and_open_page
    end
end
