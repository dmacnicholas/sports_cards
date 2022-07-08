require 'rails_helper'

RSpec.describe Brand, type: :model do
  it {should have_many(:cards) }

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:year)}
    it {should allow_value(true).for(:sold_at_retail)}
    it {should allow_value(false).for(:sold_at_retail)}
  end
end
