ActiveAdmin.register Spell do
  config.filters = false

  index do
    selectable_column

    column :uid
    column :charges
    column :reaction_time
    column :power
    column :area
    column :description

    default_actions
  end
end
