require 'rails_helper'

RSpec.describe 'Brands Index' do
  before :each do
    @prizm = Brand.create!(name: 'Prizm', year: 2022, sold_at_retail: false)
    @mosaic = Brand.create!(name: 'Mosaic', year: 2022, sold_at_retail: true)
    @donruss = Brand.create!(name: 'Donruss', year: 2022, sold_at_retail: true)
  end

  it 'shows all brands and their names' do
    visit '/brands'

    expect(page).to have_content(@prizm.name)
    expect(page).to have_content(@mosaic.name)
    expect(page).to have_content(@donruss.name)
  end
end  
