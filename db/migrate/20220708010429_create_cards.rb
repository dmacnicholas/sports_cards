class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :description
      t.boolean :graded
      t.float :value

      t.timestamps
    end
  end
end
