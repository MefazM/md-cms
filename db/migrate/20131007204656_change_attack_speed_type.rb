class ChangeAttackSpeedType < ActiveRecord::Migration
  def change
    change_column :units, :attack_speed, :integer
  end
end
