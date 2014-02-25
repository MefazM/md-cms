class SpellsAttr < ActiveRecord::Base
  belongs_to :spell

  attr_accessible :key, :value
end
