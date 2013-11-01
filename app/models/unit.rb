class Unit < ActiveRecord::Base
  # validates_presence_of :package, :name, :attack_power_min, :attack_power_max,
                        # :movement_speed, :attack_speed, :attack_range, :health_points

  attr_accessible :package, :name, :description, :movement_speed, :melee_attack_speed, :melee_attack_power_min,
                  :melee_attack_range, :health_points, :melee_attack_power_max, :range_attack, :melee_attack,
                  :range_attack_power_max, :range_attack_power_min, :range_attack_range, :range_attack_speed,
                  :resist_type, :melee_attack_damage_type, :range_attack_damage_type, :depends_on_building_package,
                  :depends_on_building_level

  ATTACK_TYPES = {
    1 => :arrow,
    2 => :fire,
    3 => :phys_damage
  }

  def self.depended_on ( package, level )
    Unit.where(:depends_on_building_package => package, :depends_on_building_level => level)
  end

  def export()
    results = []
    [:package, :name, :description, :health_points, :movement_speed].each do |attr|
      results << "#{attr.to_s} = '#{self.send(attr)}'"
    end

    [:range, :melee].each do |atk_type|
      if self.send("#{atk_type}_attack".to_sym)
        atk_results = []
        ['attack_power_max', 'attack_power_min', 'attack_range', 'attack_speed'].each do |atk_field|
          value = self.send("#{atk_type}_#{atk_field}")
          atk_results << "#{atk_type}_#{atk_field} = #{value}"
        end
        damage_type = self.send("#{atk_type}_attack_damage_type")
        atk_results << "#{atk_type}_attack_damage_type = #{damage_type}" if damage_type

        results << "#{atk_type}_attack = { #{atk_results.join(', ')} }"
      end
    end

    if self.send(:resist_type)
      results << "resist_type = #{self.send(:resist_type)}"
    end
    # self.attributes.each_pair do |name, value|
    #   puts "#{name} = #{value}"


    # end
    "{ #{results.join(', ')} }"
  end
end
