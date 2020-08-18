class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      
      t.string :day_title
      t.string :day_note
      t.text :day_detail
      t.datetime :day_start
      t.datetime :day_end
      t.string :day_color
      t.boolean :allday
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
