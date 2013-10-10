class ChangeAttackPowerMinFieldType < ActiveRecord::Migration
  def change
    change_column :units, :attack_power_min, :integer
  end
end
