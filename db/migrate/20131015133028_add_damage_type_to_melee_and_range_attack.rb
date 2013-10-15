class AddDamageTypeToMeleeAndRangeAttack < ActiveRecord::Migration
  def change
    add_column :units, :melee_attack_damage_type, :integer
    add_column :units, :range_attack_damage_type, :integer
  end
end
