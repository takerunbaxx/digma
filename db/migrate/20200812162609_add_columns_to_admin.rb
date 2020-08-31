class AddColumnsToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :prefecture_name, :string
    add_column :admins, :cityname, :string
  end
end
