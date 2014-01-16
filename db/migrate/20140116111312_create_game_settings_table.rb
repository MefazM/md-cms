class CreateGameSettingsTable < ActiveRecord::Migration
  def change
    create_table :game_settings do |t|
      t.text :value
      t.string :key
    end
  end
end
