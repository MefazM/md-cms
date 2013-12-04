class CreateSpellsTable < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.integer :charges
      t.string :uid
      t.integer :reaction_time
      t.integer :power
      t.string :description
      t.integer :area
    end

    add_index :spells, :uid, :unique => true

  end
end
