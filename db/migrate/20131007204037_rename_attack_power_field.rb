class RenameAttackPowerField < ActiveRecord::Migration
  def change
    rename_column :units, :attack_power, :attack_power_min
  end
end
