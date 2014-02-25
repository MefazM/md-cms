class RemoveOldColumnsFromSpells < ActiveRecord::Migration
  def change
    remove_column :spells, :value
    remove_column :spells, :ability_preset
    remove_column :spells, :processing_type
    remove_column :spells, :increase
    remove_column :spells, :affect_enemy_units
  end
end