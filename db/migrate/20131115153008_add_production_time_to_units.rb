class AddProductionTimeToUnits < ActiveRecord::Migration
  def change
    add_column :units, :production_time, :integer
  end
end
