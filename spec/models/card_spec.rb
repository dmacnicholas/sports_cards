require 'rails_helper'

RSpec.describe Card, type: :model do
  it {should belong_to :brand}
end
