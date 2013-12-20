class DeviceError < ActiveRecord::Base

  scope :ordered, -> {order('created_at DESC')}
  scope :grouped_by_player, -> {group(:player_id)}

  def unread?
    self.unread
  end

  def mark_as_read!
    self.unread = false
    self.save!
  end
end
