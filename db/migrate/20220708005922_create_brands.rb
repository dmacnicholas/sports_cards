class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :year
      t.boolean :sold_at_retail

      t.timestamps
    end
  end
end
