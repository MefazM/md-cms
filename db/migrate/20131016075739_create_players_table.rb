class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email
      t.string :username
    end
  end
end
