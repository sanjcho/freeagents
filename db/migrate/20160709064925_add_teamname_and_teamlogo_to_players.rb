class AddTeamnameAndTeamlogoToPlayers < ActiveRecord::Migration[5.0]
  def change
    change_table :players do |t|
      t.string :team_name
      t.string :team_logo
    end
  end
end
