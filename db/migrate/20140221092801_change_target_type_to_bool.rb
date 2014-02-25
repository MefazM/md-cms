class ChangeTargetTypeToBool < ActiveRecord::Migration
  def change
    add_column :spells, :affect_enemy_units, :boolean
    remove_column :spells, :target_type
  end
end
