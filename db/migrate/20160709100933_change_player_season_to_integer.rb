class ChangePlayerSeasonToInteger < ActiveRecord::Migration[5.0]
  def change
    change_table :players do |t|
      t.remove :season
      t.integer :season
    end
  end
end
