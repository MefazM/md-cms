class AddIncDecTypeFieldToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :increase, :boolean, :default => false
  end
end
