require 'rails_helper'

RSpec.describe Card, type: :model do
  it {should belong_to :brand}

  describe 'validations' do
    it {should validate_presence_of(:player_name)}
    it {should validate_presence_of(:description)}
    it {should allow_value(true).for(:graded)}
    it {should allow_value(false).for(:graded)}
    it {should validate_presence_of(:value)}
  end
end
