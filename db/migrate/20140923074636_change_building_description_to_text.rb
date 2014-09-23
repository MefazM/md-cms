class ChangeBuildingDescriptionToText < ActiveRecord::Migration
  def change
    change_column :buildings, :description, :text
  end
end
