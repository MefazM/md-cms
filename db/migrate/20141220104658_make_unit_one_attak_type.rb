class MakeUnitOneAttakType < ActiveRecord::Migration
  def change
    remove_column :units, :melee_attack_speed
    remove_column :units, :melee_attack_power_min
    remove_column :units, :melee_attack_range
    remove_column :units, :melee_attack_power_max
    remove_column :units, :range_attack
    remove_column :units, :melee_attack
    remove_column :units, :range_attack_power_max
    remove_column :units, :range_attack_power_min
    remove_column :units, :range_attack_range
    remove_column :units, :range_attack_speed
    remove_column :units, :resist_type
    remove_column :units, :melee_attack_damage_type
    remove_column :units, :range_attack_damage_type

    add_column :units, :attack_speed, :float
    add_column :units, :attack_range, :float
    add_column :units, :attack_power_min, :integer
    add_column :units, :attack_power_max, :integer
  end
end
