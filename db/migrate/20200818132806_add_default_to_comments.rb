class AddDefaultToComments < ActiveRecord::Migration[5.2]
  def change
    
    change_column_default :comments, :score, 0
    change_column_null :comments, :score, false
    
    
  end
end
