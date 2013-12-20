class CreateDeviceErrors < ActiveRecord::Migration
  def change
    create_table :device_errors do |t|
      t.text :error_message
      t.text :stack_trace

      t.string :memory
      t.string :model
      t.string :name
      t.string :architecture_info
      t.string :app_version_string
      t.string :max_texture_size
      t.string :platform_name

      t.boolean :unread, :default => true

      t.integer :player_id

      t.timestamps
    end
  end
end
