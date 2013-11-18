class Building < ActiveRecord::Base
  validates_presence_of :name, :description, :level, :package, :production_time

  attr_accessible :name, :description, :level, :package, :production_time

  validates :level, :uniqueness => { :scope => :package, :message => 'Building with same level in same package exists!' }

  def updateable_to
    Building.find_by_package_and_level(self.package, self.level + 1)
  end
end
