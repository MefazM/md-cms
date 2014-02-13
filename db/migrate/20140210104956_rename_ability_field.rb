class RenameAbilityField < ActiveRecord::Migration
  def change
    rename_column :spells, :ability_type, :ability_preset
    rename_column :spells, :power, :value
  end
end
