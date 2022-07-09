require 'rails_helper'

RSpec.describe 'Brands Index' do
  before :each do
    @brand_1 = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @brand_2 = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @brand_3 = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
  end
  # User Story 1, Parent Index
      # For each parent table
      # As a visitor
      # When I visit '/parents'
      # Then I see the name of each parent record in the system
  it 'shows all brands and their names' do
    visit '/brands'

    expect(page).to have_content(@brand_1.name)
    expect(page).to have_content(@brand_2.name)
    expect(page).to have_content(@brand_3.name)
  end
end
