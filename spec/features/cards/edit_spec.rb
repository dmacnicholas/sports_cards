require 'rails_helper'

RSpec.describe 'Edit Card' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
  # User Story 14, Child Update
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
  it 'can update a card' do
    visit "/cards/#{@card_1.id}/edit"

    fill_in 'Player name', with: 'Michael Jordan'
    fill_in 'Description', with: 'Red Ice Refactor'
    fill_in 'Value', with: '1200.00'
    click_button 'Update Card'

    expect(current_path).to eq("/cards/#{@card_1.id}")
    expect(page).to have_content('Michael Jordan')
    expect(page).to have_content('Red Ice Refactor')
    expect(page).to have_content(1200.00)
  end
end
