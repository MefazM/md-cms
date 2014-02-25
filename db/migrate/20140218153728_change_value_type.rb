class ChangeValueType < ActiveRecord::Migration
  def change
    change_column :spells, :value, :string
  end
end
