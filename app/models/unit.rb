class Unit < ActiveRecord::Base
  # validates_presence_of :package, :name, :attack_power_min, :attack_power_max, 
                        # :movement_speed, :attack_speed, :attack_range, :health_points

  attr_accessible :package, :name, :description, :movement_speed, :melee_attack_speed, :melee_attack_power_min, 
                  :melee_attack_range, :health_points, :melee_attack_power_max, :range_attack, :melee_attack, 
                  :range_attack_power_max, :range_attack_power_min, :range_attack_range, :range_attack_speed

end
