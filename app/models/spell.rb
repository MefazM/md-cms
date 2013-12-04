class Spell < ActiveRecord::Base


  validates_presence_of :charges, :uid, :reaction_time, :power, :area
  validates_uniqueness_of :uid


  attr_accessible :charges, :uid, :reaction_time, :power, :description, :area

end