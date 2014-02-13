class Spell < ActiveRecord::Base

  validates_presence_of :uid, :time, :value, :area, :ability_preset,
    :target_type, :mana_cost, :processing_type

  validates_uniqueness_of :uid

  attr_accessible :uid, :time, :value, :area, :ability_preset,
    :target_type, :mana_cost, :processing_type, :description

  TAGET_TYPES = [
    :friendly,
    :enemy,
    :both
  ]

  ABILITY_PRESETS = [
    :damage,
    :heal,
    :push,
    :stun,
    :reduce_speed,
    :reduce_hp,
    :reduce_attack,
    :reduce_attack_speed,
    :freeze
  ]

  PROCESSING_TYPES = [
    :instant,
    :during_t,
    :after_t,
    :effect_switch
  ]
end