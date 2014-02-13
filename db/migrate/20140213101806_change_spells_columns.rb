class ChangeSpellsColumns < ActiveRecord::Migration
  def change
    change_column :spells, :ability_preset, :string
    change_column :spells, :processing_type, :string
    change_column :spells, :target_type, :string
  end
end
