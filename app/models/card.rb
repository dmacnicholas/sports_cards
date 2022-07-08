class Card < ApplicationRecord
  belongs_to :brand
  validates :player_name, presence: true
  validates :description, presence: true
  validates :graded, inclusion: [true, false]
  validates :value, presence: true

end
