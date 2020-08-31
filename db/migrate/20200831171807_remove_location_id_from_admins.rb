class RemoveLocationIdFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :location_id
  end
end
