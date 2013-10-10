class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :package
      t.string :name
      t.string :description

      t.integer :initiative_min
      t.integer :initiative_max

      t.float :movement_speed
      
      t.float :attack_speed
      t.float :attack_power
      t.float :attack_range

      t.integer :health_points

      t.timestamps
    end

    add_index :units, :package, :unique => true
    add_index :units, :name, :unique => true
  end
end