class ChangeAuthenticationsRelation < ActiveRecord::Migration
  def change
    rename_column :authentications, :user_id, :player_id
  end
end
