class AddDependencyRelationToUnits < ActiveRecord::Migration
  def change
    add_column :units, :depends_on_building_package, :string
    add_column :units, :depends_on_building_level, :integer
  end
end
