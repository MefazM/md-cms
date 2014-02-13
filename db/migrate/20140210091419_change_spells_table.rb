class ChangeSpellsTable < ActiveRecord::Migration
  def change
    # add new fields
    add_column :spells, :target_type, :integer
    add_column :spells, :mana_cost, :integer
    add_column :spells, :ability_type, :integer
    # remove old shit
    remove_column :spells, :charges, :integer
    # rename
    change_column :spells, :reaction_time, :time
  end
end
