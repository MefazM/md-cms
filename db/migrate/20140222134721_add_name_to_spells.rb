class AddNameToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :name, :string
  end
end
