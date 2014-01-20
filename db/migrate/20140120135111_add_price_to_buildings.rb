class AddPriceToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :price, :integer
    add_column :buildings, :points, :integer
  end
end
