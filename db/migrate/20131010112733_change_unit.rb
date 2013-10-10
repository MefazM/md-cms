class ChangeUnit < ActiveRecord::Migration
  def change
    add_column :units, :range_attack, :boolean
    add_column :units, :melee_attack, :boolean

    rename_column :units, :attack_power_max, :melee_attack_power_max
    rename_column :units, :attack_power_min, :melee_attack_power_min
    rename_column :units, :attack_range, :melee_attack_range
    rename_column :units, :attack_speed, :melee_attack_speed

    add_column :units, :range_attack_power_max, :integer
    add_column :units, :range_attack_power_min, :integer
    add_column :units, :range_attack_range, :float
    add_column :units, :range_attack_speed, :integer
  end
end
