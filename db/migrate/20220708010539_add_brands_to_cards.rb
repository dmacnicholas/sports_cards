class AddBrandsToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :brand, foreign_key: true
  end
end
