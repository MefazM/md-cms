ActiveAdmin.register Unit do
  config.filters = false

  form :partial => "form"

  index :download_links => false do
    selectable_column

    column :uid
    column :name
    column :health_points
    column :movement_speed
    column :range_attack
    column :melee_attack

    column :production_time

    column :resist_type do |unit|
      unit.resist_type.nil? ? 'none' : Unit::ATTACK_TYPES[unit.resist_type]
    end

    column :melee_attack_damage_type do |unit|
      unit.melee_attack_damage_type.nil? ? '-' : Unit::ATTACK_TYPES[unit.melee_attack_damage_type]
    end

    column :range_attack_damage_type do |unit|
      unit.range_attack_damage_type.nil? ? '-' : Unit::ATTACK_TYPES[unit.range_attack_damage_type]
    end

    column 'Depends on' do |unit|
      if unit.depends_on_building_uid
        "#{unit.depends_on_building_uid}_#{unit.depends_on_building_level}lvl."
      end
    end

    default_actions
  end
end
