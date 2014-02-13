ActiveAdmin.register Spell do
  config.filters = false

  index :download_links => false do
    selectable_column

    column :uid
    column :ability_preset do |spell|
      spell.ability_preset
    end
    column :target_type do |spell|
      spell.target_type
    end

    column :processing_type do |spell|
      spell.processing_type
    end

    column :area
    column :time

    default_actions
  end

  form do |f|
    f.inputs "Settings" do
      [:uid, :description, :mana_cost].each do |field|
        f.input field
      end
    end

    f.inputs "Ability" do
      f.input :ability_preset, :as => :select, :collection => Spell::ABILITY_PRESETS
      f.input :value
    end

    f.inputs "Targeting" do
      f.input :target_type, :as => :select, :collection => Spell::TAGET_TYPES
      f.input :area
    end

    f.inputs "Processing type" do
      f.input :processing_type, :as => :select, :collection => Spell::PROCESSING_TYPES
      f.input :time
    end

    f.actions
  end
end
