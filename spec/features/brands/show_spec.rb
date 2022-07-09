require 'rails_helper'

RSpec.describe 'Brands Show' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
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
end
