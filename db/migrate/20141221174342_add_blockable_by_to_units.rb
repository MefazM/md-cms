class AddBlockableByToUnits < ActiveRecord::Migration
  def change
    add_column :units, :blockable_by, :integer, defult: 0
  end
end
