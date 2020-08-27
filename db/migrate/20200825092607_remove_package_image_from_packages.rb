class RemovePackageImageFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :package_image
  end
end
