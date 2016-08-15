class Items < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
