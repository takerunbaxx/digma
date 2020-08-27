class AddColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :reservation, foreign_key: true
  end
end
