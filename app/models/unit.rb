class Unit < ActiveRecord::Base
  # validates_presence_of :package, :name, :attack_power_min, :attack_power_max, 
                        # :movement_speed, :attack_speed, :attack_range, :health_points

  attr_accessible :package, :name, :description, :movement_speed, :melee_attack_speed, :melee_attack_power_min, 
                  :melee_attack_range, :health_points, :melee_attack_power_max, :range_attack, :melee_attack, 
                  :range_attack_power_max, :range_attack_power_min, :range_attack_range, :range_attack_speed,
                  :resist_type, :melee_attack_damage_type, :range_attack_damage_type

  ATTACK_TYPES = {
    1 => :arrow,
    2 => :fire,
    3 => :phys_damage
  }
end
