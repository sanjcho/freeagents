class ChangeCaphitInPlayer < ActiveRecord::Migration
  def up
    change_table :players do |t|
      t.remove :caphit
      t.float :caphit
    end
  end
  def down
    change_table :players do |t|
      t.integer :caphit
    end  	
  end
end
