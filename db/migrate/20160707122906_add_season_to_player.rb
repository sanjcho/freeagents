class AddSeasonToPlayer < ActiveRecord::Migration
  def change
  	change_table :players do |t|
  	  t.string :season
  	end
  end
end
