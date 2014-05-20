require 'yaml'
require 'pry'

namespace :game_settings do
  desc "Import game settings from presets. WARNING! All old settings will dropped"
  task :import => :environment do
    puts "Remove old..."
    GameSettings.destroy_all
    print "Importing"
    game_settings_data = YAML.load_file("#{Rails.root}/config/game_settings.yml")

    coins_production = game_settings_data['coins_production'].symbolize_keys

    [:storage_building_uid, :coin_generator_uid].each do |field|
      GameSettings.create :value => coins_production[field], :key => field
      print('.')
    end

    [:storage_capacity_per_level, :coins_generation_per_level].each do |field|
      GameSettings.create :value => coins_production[field].to_json, :key => field
      print('.')
    end

    GameSettings.create(
      :value => game_settings_data['mana_storage_settings'].to_json,
      :key => :mana_settings_per_level
    )

    print("OK! \n")
  end
end