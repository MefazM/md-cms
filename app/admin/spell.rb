ActiveAdmin.register Spell do
  config.filters = false

  index :download_links => false do
    selectable_column
    column :name
    column :uid
    column :area
    default_actions
  end

  show do
    attributes_table do
      [:uid, :time, :description, :area, :mana_cost, :name, :client_description, :spellbook_timing].each do |type|
        row type
      end
    end
  end

  form :partial => 'form'
end
