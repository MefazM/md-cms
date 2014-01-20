class Building < ActiveRecord::Base
  validates_presence_of :name, :description, :level, :uid, :production_time, :price

  attr_accessible :name, :description, :level, :uid, :production_time, :price

  validates :level, :uniqueness => { :scope => :uid, :message => 'Building with same level in same uid exists!' }

  def updateable_to
    Building.find_by_uid_and_level(self.uid, self.level + 1)
  end
end
