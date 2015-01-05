class AddDefaultParamsSlotsToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :slot_a, :string
    add_column :spells, :slot_b, :string
    add_column :spells, :slot_c, :string
    add_column :spells, :slot_d, :string
  end
end
