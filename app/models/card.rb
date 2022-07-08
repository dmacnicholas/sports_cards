class Card < ApplicationRecord
  belongs_to :brand
  validates :player_name, presence: true
  validates :description, presence: true
  validates :graded, presence: true
  validates :value, presence: true

end
