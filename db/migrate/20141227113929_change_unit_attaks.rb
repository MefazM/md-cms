class ChangeUnitAttaks < ActiveRecord::Migration
  def change
    remove_column :units, :attack_power_min
    rename_column :units, :attack_power_max, :attack_power
  end
end
