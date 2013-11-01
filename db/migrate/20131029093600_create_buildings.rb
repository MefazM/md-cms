class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :description
      t.integer :level
      t.string :package
    end

    add_index :buildings, [:level, :package], :unique => true

  end
end
