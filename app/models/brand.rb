class Brand < ApplicationRecord
  has_many :cards
  validates :name, presence: true
  validates :year, presence: true
  validates :sold_at_retail, presence: true

end
