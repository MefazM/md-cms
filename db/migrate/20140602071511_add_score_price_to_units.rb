class AddScorePriceToUnits < ActiveRecord::Migration
  def change
    add_column :units, :score_price, :integer
  end
end
