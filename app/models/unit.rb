class Unit < ActiveRecord::Base

  validates_presence_of :uid, :name, :description, :movement_speed,
                        :health_points, :production_time, :price

  attr_accessible :uid, :name, :description, :movement_speed, :melee_attack_speed, :melee_attack_power_min,
                  :melee_attack_range, :health_points, :melee_attack_power_max, :range_attack, :melee_attack,
                  :range_attack_power_max, :range_attack_power_min, :range_attack_range, :range_attack_speed,
                  :resist_type, :melee_attack_damage_type, :range_attack_damage_type, :depends_on_building_uid,
                  :depends_on_building_level, :production_time, :price

  ATTACK_TYPES = {
    1 => :arrow,
    2 => :fire,
    3 => :phys_damage,
    4 => :axe,
    5 => :fists
  }

  def self.depended_on ( uid, level )
    Unit.where(:depends_on_building_uid => uid, :depends_on_building_level => level)
  end

end
