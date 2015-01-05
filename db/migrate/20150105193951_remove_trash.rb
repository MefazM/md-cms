class RemoveTrash < ActiveRecord::Migration
  def change
    drop_table :spells_attrs
    drop_table :game_settings
  end
end
