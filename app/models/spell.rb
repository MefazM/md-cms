class Spell < ActiveRecord::Base

  validates_presence_of :uid, :area, :mana_cost, :name

  validates_uniqueness_of :uid, :name

  attr_accessible :uid, :time, :area, :mana_cost, :description, :name, :slot_a, :slot_b, :slot_c, :slot_d, :opts_description


  ELEMENTS = [
    :fire,
    :earth,
    :water,
    :air
  ]

  FIGURES = [
    :rect,
    :circle,
    :arrow,
    :z
  ]

  def self.uids
    uids = []
    FIGURES.each do |figure|
      ELEMENTS.each do |element|
        uid = "#{figure}_#{element}"

        label = uid
        label += ' (not configured)' if self.exists?(:uid => uid).nil?

        uids << [label, uid]
      end
    end

    uids
  end

  def self.not_configured_uids
    uids = []
    FIGURES.each do |figure|
      ELEMENTS.each do |element|
        uid = "#{figure}_#{element}"
        uids << uid unless self.exists?(:uid => uid)
      end
    end

    uids
  end
end