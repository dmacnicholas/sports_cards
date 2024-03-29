require 'rails_helper'

RSpec.describe 'Brands Edit' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
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
end
