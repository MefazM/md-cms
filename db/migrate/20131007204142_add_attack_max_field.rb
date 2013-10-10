class AddAttackMaxField < ActiveRecord::Migration
  def change
    add_column :units, :attack_power_max, :integer
  end
end
