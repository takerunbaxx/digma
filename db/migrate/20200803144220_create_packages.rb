class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.references :admin, foreign_key: true
      t.string :package_name, null: false
      t.integer :price, null: false
      t.string :package_image, null: false
      t.text :package_outline, null: false
      t.text :package_detail, null: false
      t.text :package_summary, null: false

      t.timestamps
    end
  end
end
