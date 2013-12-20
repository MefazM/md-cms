ActiveAdmin.register DeviceError do
  actions :index, :show, :destroy

  filter :model
  filter :architecture_info
  filter :platform_name
  filter :unread

  show do |error|
    error.mark_as_read!

    h3 error.error_message
    div do
      pre error.stack_trace
    end

    attributes_table do
      row :texture_memory do
        error.memory
      end
      row :model
      row :name
      row :architecture_info
      row :app_version_string
      row :max_texture_size
      row :platform_name
      row :created_at
    end
  end

  index :download_links => false do
    selectable_column

    column :error_message
    column :status do |error|
      status_tag( error.unread? ? "new" : "viewed", error.unread? ? :error :  :ok )
    end
    column :platform_name
    column :updated_at

    # actions do |resource|
    #   link_to('view', admin_crash_log_path(:player_id => resource.player_id))
    # end
    default_actions
  end

  controller do
    def scoped_collection
      DeviceError.ordered
    end
  end

end
