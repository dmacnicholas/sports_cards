class Brand < ApplicationRecord
  has_many :cards
  validates :name, presence: true
  validates :year, presence: true
  validates :sold_at_retail, inclusion: [true, false]

  def self.sort_by_new
    order(created_at: :desc)
  end

  def card_count
    cards.count
  end

end
