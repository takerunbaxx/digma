class Locations < ActiveRecord::Migration[5.2]
  def up
    drop_table :locations
  end
  
  def down
  end
end
