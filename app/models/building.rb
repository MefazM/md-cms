class Building < ActiveRecord::Base
  validates_presence_of :name, :description, :level, :uid, :production_time, :price

  attr_accessible :name, :description, :level, :uid, :production_time, :price

  validates :level, :uniqueness => { :scope => :uid, :message => 'Building with same level in same uid exists!' }

  def updateable_to
    Building.find_by_uid_and_level(self.uid, self.level + 1)
  end

  def updateable?
    Building.exists?(:uid => self.uid, :level => (self.level + 1))
  end

  ACTIONS_TYPES = [:build, :info, :units, :harvest_collect, :harvest_info]

  def unit_producer?
    Unit.exists?(:depends_on_building_uid => self.uid, :depends_on_building_level => self.level)
  end

  def actions
    _actions = []

    _actions << :units if unit_producer?
    _actions << :build if updateable?

    _actions.join(' ')
  end

end
