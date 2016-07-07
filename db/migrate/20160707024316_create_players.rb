class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :team, index: true, foreign_key: true
      t.string :role
      t.integer :caphit

      t.timestamps null: false
    end
  end
end
