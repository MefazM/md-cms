class Spell < ActiveRecord::Base

  validates_presence_of :uid, :area, :mana_cost, :name

  validates_uniqueness_of :uid, :name

  attr_accessible :uid, :time, :area, :mana_cost, :description, :spells_attrs_attributes, :name

  has_many :spells_attrs

  accepts_nested_attributes_for :spells_attrs, :allow_destroy => true

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