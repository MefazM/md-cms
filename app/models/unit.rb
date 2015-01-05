class Unit < ActiveRecord::Base

  validates_presence_of :uid, :name, :description, :movement_speed,
                        :health_points, :production_time, :price, :score_price

  attr_accessible :uid, :name, :description, :movement_speed, :health_points,
                  :depends_on_building_uid, :depends_on_building_level,
                  :production_time, :price, :score_price,
                  :attack_speed, :attack_power, :attack_range,
                  :blockable_by, :distance_attack


  def self.depended_on ( uid, level )
    Unit.where(:depends_on_building_uid => uid, :depends_on_building_level => level)
  end

  def self.updates
    game_settings_json = File.read(Rails.root + "config/game_settings/game_settings.json")
    game_settings = JSON.parse game_settings_json

    game_settings["unit_items_updates"].keys

  end

end
