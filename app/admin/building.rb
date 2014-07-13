ActiveAdmin.register Building do
  config.filters = false
  config.batch_actions = false

  index :download_links => false do

    selectable_column
    column :name
    column :uid
    column :level

    column :actions

    column :production_time
    column :price

    default_actions

  end

  form :partial => "form"
end
