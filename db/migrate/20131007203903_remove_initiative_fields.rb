class RemoveInitiativeFields < ActiveRecord::Migration
  def change
    remove_column :units, :initiative_min
    remove_column :units, :initiative_max
  end
end
