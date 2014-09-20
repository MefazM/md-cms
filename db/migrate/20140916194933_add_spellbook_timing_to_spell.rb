class AddSpellbookTimingToSpell < ActiveRecord::Migration
  def change
    add_column :spells, :spellbook_timing, :integer
  end
end
