class AddColumnsToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :reservation_email, :string
    add_column :reservations, :user_phone, :string
    add_column :reservations, :other_request, :string
  end
end
