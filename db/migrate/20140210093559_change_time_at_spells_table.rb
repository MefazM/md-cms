class ChangeTimeAtSpellsTable < ActiveRecord::Migration
  def change
    change_column :spells, :reaction_time, :integer
    rename_column :spells, :reaction_time, :time
  end
end
