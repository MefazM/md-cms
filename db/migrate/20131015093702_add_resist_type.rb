class AddResistType < ActiveRecord::Migration
  def change
    add_column :units, :resist_type, :integer
  end
end
