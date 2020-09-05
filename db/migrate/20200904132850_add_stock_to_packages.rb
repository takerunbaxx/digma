class AddStockToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :stock, :integer, default: 0
  end
end
