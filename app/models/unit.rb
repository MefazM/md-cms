class Unit < ActiveRecord::Base
  validates_presence_of :package, :name, :attack_power_min, :attack_power_max, 
                        :movement_speed, :attack_speed, :attack_range, :health_points

  attr_accessible :package, :name, :attack_power_min, :attack_power_max, :description,
                  :movement_speed, :attack_speed, :attack_range, :health_points

end
