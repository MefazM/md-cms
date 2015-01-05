ActiveAdmin.register Unit do
  config.filters = false

  form :partial => "form"

  index :download_links => false do
    selectable_column

    column :uid
    column :name
    column :price
    column :health_points
    column :movement_speed

    column :production_time

    column 'Attack (power/speed/range)' do |unit|
      [unit.attack_power, unit.attack_speed, unit.attack_range].join(' / ')
    end

    column 'Depends on' do |unit|
      unless unit.depends_on_building_uid.blank?
        "#{unit.depends_on_building_uid}_#{unit.depends_on_building_level}lvl."
      end
    end

    default_actions
  end
end
