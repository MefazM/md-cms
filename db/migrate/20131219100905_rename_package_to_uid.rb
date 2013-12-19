class RenamePackageToUid < ActiveRecord::Migration
  def change
    rename_column :units, :depends_on_building_package, :depends_on_building_uid
    rename_column :units, :package, :uid

    rename_column :buildings, :package, :uid
  end
end
