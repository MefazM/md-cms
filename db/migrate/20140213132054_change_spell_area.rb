class ChangeSpellArea < ActiveRecord::Migration
  def change
    change_column :spells, :area, :float
  end
end
