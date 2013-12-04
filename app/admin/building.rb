ActiveAdmin.register Building do
  config.filters = false
  config.batch_actions = false

  index do

    selectable_column
    column :name
    column :package
    column :level
    column :production_time

    default_actions

    render partial: 'export_buildings'
  end

  form :partial => "form"


  # index do
  #   selectable_column

  #   column :package
  #   column :name
  #   column :health_points
  #   column :movement_speed
  #   column :range_attack
  #   column :melee_attack

  #   column :resist_type do |type|

  #     type.resist_type.nil? ? 'none' : Unit::ATTACK_TYPES[type.resist_type]
  #   end

  #   column :melee_attack_damage_type do |type|
  #     type.melee_attack_damage_type.nil? ? '-' : Unit::ATTACK_TYPES[type.melee_attack_damage_type]
  #   end

  #   column :range_attack_damage_type do |type|
  #     type.range_attack_damage_type.nil? ? '-' : Unit::ATTACK_TYPES[type.range_attack_damage_type]
  #   end

  #   default_actions
  # end
end