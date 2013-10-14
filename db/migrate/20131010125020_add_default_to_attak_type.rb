class AddDefaultToAttakType < ActiveRecord::Migration
  def change
    change_column :units, :range_attack, :boolean, :default => false
    change_column :units, :melee_attack, :boolean, :default => false
  end
end
