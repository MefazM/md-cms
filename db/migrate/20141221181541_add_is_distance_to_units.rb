class AddIsDistanceToUnits < ActiveRecord::Migration
  def change
    add_column :units, :distance_attack, :boolean, default: false
  end
end
