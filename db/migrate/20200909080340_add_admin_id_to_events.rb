class AddAdminIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :admin, foreign_key: true
  end
end
