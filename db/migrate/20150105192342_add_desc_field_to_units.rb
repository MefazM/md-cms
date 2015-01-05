class AddDescFieldToUnits < ActiveRecord::Migration
  def change
    add_column :spells, :opts_description, :text
  end
end
