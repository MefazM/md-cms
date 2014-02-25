class CreateSpellsAttrs < ActiveRecord::Migration
  def change
    create_table :spells_attrs do |t|
      t.integer :spell_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
