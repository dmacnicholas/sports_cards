require 'rails_helper'

RSpec.describe Brand, type: :model do
  it {should have_many(:cards) }
end
