class ChngAllTimingsToSeconds < ActiveRecord::Migration
  def change
    change_column :units, :melee_attack_speed, :float
    change_column :units, :range_attack_speed, :float
    change_column :spells, :time, :float
    change_column :spells, :spellbook_timing, :float
  end
end
