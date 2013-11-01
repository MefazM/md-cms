class Building < ActiveRecord::Base
  # validates_presence_of :package, :name, :attack_power_min, :attack_power_max,
                        # :movement_speed, :attack_speed, :attack_range, :health_points

  attr_accessible :name, :description, :level, :package

  validates :level, :uniqueness => { :scope => :package, :message => 'Building with same level in same package exists!' }

  def updateable_to
    Building.find_by_package_and_level(self.package, self.level + 1)
  end
end
