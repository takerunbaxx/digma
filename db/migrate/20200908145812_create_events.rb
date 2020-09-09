class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      
      t.string :note
      t.string :note_content
      t.datetime :start_event
      t.datetime :end_event
      

      t.timestamps
    end
  end
end
