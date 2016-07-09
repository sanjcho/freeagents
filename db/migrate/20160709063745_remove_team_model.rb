class RemoveTeamModel < ActiveRecord::Migration[5.0]
  def up
    change_table :players do |t|
      t.remove_references :team
    end
    drop_table :teams
  end

  def down
    create_table :teams do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
