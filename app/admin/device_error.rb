ActiveAdmin.register DeviceError do
  config.batch_actions = false

  actions :index

  filter :model
  filter :architecture_info
  filter :platform_name
  filter :unread

  index :download_links => false do
    selectable_column

    column :error_message
    column :status do |error|
      status_tag( error.unread? ? "new" : "viewed", error.unread? ? :error :  :ok )
    end
    column :platform_name
    column :updated_at

    actions do |resource|

      link_to('view', admin_crash_log_path(:player_id => resource.player_id))
    end
  end

  controller do
    def scoped_collection
      DeviceError.grouped_by_player.ordered
    end
  end

end
