class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :location
      t.integer :user_id
      t.integer :party_id
      t.integer :attack
      t.integer :health
      t.integer :XP
      t.integer :defense
      t.integer :max_health


      t.timestamps null: false
    end
  end
end
