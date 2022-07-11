require 'rails_helper'

RSpec.describe 'Create Card' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
  # User Story 13, Parent Child Creation
    # As a visitor
    # When I visit a Parent Childs Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed

  it 'can create new brand card' do

    visit "/brands/#{@brand_1.id}/cards/new"
    fill_in 'Player name', with: 'Nikola Jokic'
    fill_in 'Description', with: 'Blue Ice Refactor'
    check 'Graded'
    fill_in 'Value', with: '555.00'
    click_on 'Create Card'

    expect(current_path).to eq("/brands/#{@brand_1.id}/cards")
    expect(page).to have_content('Nikola Jokic')
    expect(page).to have_content('555.00')
    expect(page).to have_content('Blue Ice Refactor')
  end
end
