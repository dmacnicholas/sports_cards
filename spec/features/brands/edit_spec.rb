require 'rails_helper'

RSpec.describe 'Brands Edit' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
    @card_1 = @brand_1.cards.create!(player_name: 'LeBron James', description: 'Red Fast Break', graded: true, value: 250.00)
    @card_2 = @brand_1.cards.create!(player_name: 'Luka Doncic', description: 'Blue Fast Break', graded: false, value: 135.00)
    @card_3 = @brand_1.cards.create!(player_name: 'Ja Morant', description: 'Purple Ice Auto', graded: true, value: 900.00)
  end
  # User Story 12, Parent Update
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'can update brand' do
   visit "/brands/#{@brand_1.id}/edit"
   fill_in 'Name', with: 'Chronicles'
   fill_in 'Year', with: '2021'
   check 'Sold at retail'
   click_on 'Update Brand'

   expect(current_path).to eq("/brands/#{@brand_1.id}")
   expect(page).to have_content('Chronicles')
   expect(page).to have_content('2021')
  end
  # User Story 19, Parent Delete
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent
  it 'has link to delete a brand' do
    visit '/brands'

    expect(page).to have_content("#{@brand_1.name}")
    expect(page).to have_content("#{@brand_1.year}")

    visit "/brands/#{@brand_1.id}"

    expect(page).to have_link('Delete Brand')

    click_link 'Delete Brand'
    expect(current_path).to eq('/brands')

    expect(page).to_not have_content("#{@brand_1.name}")
    expect(page).to_not have_content("#{@brand_1.year}")
  end
end
