class ProcessingType < ActiveRecord::Migration
  def change
    add_column :spells, :processing_type, :integer
  end
end
