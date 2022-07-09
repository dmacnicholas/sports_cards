require 'rails_helper'

RSpec.describe 'Brands Show' do
  before :each do
    @prizm = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @mosaic = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @donruss = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
  end
  # User Story 2, Parent Show
   # As a visitor
   # When I visit '/parents/:id'
   # Then I see the parent with that id including the parent's attributes:
   # - data from each column that is on the parent table
  it 'shows all brands ids and attributes' do
    visit "/brands/#{@prizm.id}"


    expect(page).to have_content(@prizm.name)
    expect(page).to have_content(@prizm.year)
    expect(page).to have_content(@prizm.sold_at_retail)
    expect(page).to have_content(@prizm.created_at)
    expect(page).to have_content(@prizm.updated_at)

    expect(page).to_not have_content(@mosaic.name)


  end
end
