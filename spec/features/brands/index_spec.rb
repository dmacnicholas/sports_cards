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
  # User Story 6, Parent Index sorted by Most Recently Created
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
  it 'orders brands by most recently created' do
    visit '/brands'

    expect(@brand_3.name).to appear_before(@brand_2.name)
    expect(@brand_2.name).to appear_before(@brand_1.name)
    # save_and_open_page
  end
  # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
  it 'has link to card index' do
    visit '/brands'

    expect(page).to have_link('Cards Index')
    click_link 'Cards Index'
    expect(current_path).to eq('/cards')
    # save_and_open_page
  end
  # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
  it 'has link to brand index' do
    visit '/brands'

    expect(page).to have_link('Brands Index')
    click_link 'Brands Index'
    expect(current_path).to eq('/brands')
    # save_and_open_page
  end
  # User Story 17, Parent Update From Parent Index Page
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
  it 'has links to edit brands' do
   visit '/brands'

   expect(page).to have_link('Edit')
   click_link 'Edit'
   expect(current_path).to eq("/brands/#{@brand_1.id}/edit")
   end
 end
