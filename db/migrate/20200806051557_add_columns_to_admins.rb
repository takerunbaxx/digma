class AddColumnsToAdmins < ActiveRecord::Migration[5.2]
  def change
    
    #add_column :admins, :facility_name, :string
    add_column :admins, :homeadress, :string
    add_column :admins, :phone, :string
    add_column :admins, :open, :datetime
    add_column :admins, :close, :datetime
    add_column :admins, :supplementary_info, :string
  end
end
