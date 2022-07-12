class Card < ApplicationRecord
  belongs_to :brand
  validates :player_name, presence: true
  validates :description, presence: true
  validates :graded, inclusion: [true, false]
  validates :value, presence: true

  def self.show_graded_cards
    where(graded: true)
  end

  def self.alphabetical
    binding.pry
    order(:player_name)
  end
end
