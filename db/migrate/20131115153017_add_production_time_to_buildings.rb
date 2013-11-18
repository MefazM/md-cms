class AddProductionTimeToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :production_time, :integer
  end
end
