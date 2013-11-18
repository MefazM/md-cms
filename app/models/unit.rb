class Unit < ActiveRecord::Base

  validates_presence_of :package, :name, :description, :movement_speed,
                        :health_points, :production_time

  attr_accessible :package, :name, :description, :movement_speed, :melee_attack_speed, :melee_attack_power_min,
                  :melee_attack_range, :health_points, :melee_attack_power_max, :range_attack, :melee_attack,
                  :range_attack_power_max, :range_attack_power_min, :range_attack_range, :range_attack_speed,
                  :resist_type, :melee_attack_damage_type, :range_attack_damage_type, :depends_on_building_package,
                  :depends_on_building_level, :production_time

  ATTACK_TYPES = {
    1 => :arrow,
    2 => :fire,
    3 => :phys_damage,
    4 => :axe,
    5 => :fists
  }

  def self.depended_on ( package, level )
    Unit.where(:depends_on_building_package => package, :depends_on_building_level => level)
  end

  def export()
    results = []
    [:package, :name, :description, :health_points, :movement_speed, :production_time].each do |attr|
      results << "#{attr.to_s} = '#{self.send(attr)}'"
    end

    [:range_attack, :melee_attack].each do |atk_type|
      if self.send("#{atk_type}".to_sym)
        atk_results = []
        ['power_max', 'power_min', 'range', 'speed'].each do |atk_field|
          value = self.send("#{atk_type}_#{atk_field}")
          atk_results << "#{atk_field} = #{value}"
        end
        damage_type = self.send("#{atk_type}_damage_type")
        atk_results << "type = '#{ATTACK_TYPES[damage_type]}'" if damage_type

        results << "#{atk_type} = { #{atk_results.join(', ')} }"
      end
    end

    if self.send(:resist_type)
      results << "resist_type = '#{ATTACK_TYPES[self.send(:resist_type)]}'"
    end
    # self.attributes.each_pair do |name, value|
    #   puts "#{name} = #{value}"


    # end
    "{ #{results.join(', ')} }"
  end
end
