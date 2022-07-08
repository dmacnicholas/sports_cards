require 'rails_helper'

RSpec.describe Card, type: :model do
  it {should belong_to :brand}

  describe 'validations' do
    it {should validate_presence_of(:player_name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:graded)}
    it {should validate_presence_of(:value)}
  end
end
