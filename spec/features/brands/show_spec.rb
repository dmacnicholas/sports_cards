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
  # User Story 7, Parent Child Count
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
  it 'shows the amount of cards per brand' do
    visit "/brands/#{@brand_1.id}"

    expect(page).to have_content("Number of Cards: #{@brand_1.cards.count}")
    # save_and_open_page
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
  # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
  it 'has link to brand index' do
    visit "/brands/#{@brand_1.id}"

    expect(page).to have_link('Brands Index')
    click_link 'Brands Index'
    expect(current_path).to eq('/brands')
    # save_and_open_page
  end
  # User Story 10, Parent Child Index Link
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it 'has link to the brands card index' do
    visit "/brands/#{@brand_1.id}"

    expect(page).to have_link('Cards')
    click_link 'Cards'
    expect(current_path).to eq("/brands/#{@brand_1.id}/cards")
    # save_and_open_page
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
  end
end
