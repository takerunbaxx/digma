class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :package, foreign_key: true, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :participants #予約人数

      t.timestamps
    end
  end
end
