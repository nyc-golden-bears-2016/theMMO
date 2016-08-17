class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :pos_x, default: 0
      t.integer :pos_y, default: 0
      t.integer :level, default: 1
      t.integer :user_id, default: 0
      t.integer :party_id, default: 0
      t.integer :attack, default: 0
      t.integer :health, default: 0
      t.integer :XP, default: 0
      t.integer :defense, default: 0
      t.integer :max_health, default: 0

      t.timestamps null: false
    end
  end
end
