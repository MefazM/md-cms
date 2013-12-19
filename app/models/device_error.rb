class DeviceError < ActiveRecord::Base

  def unread?
    self.unread
  end

  def mark_as_read!
    self.unread = false
    self.save!
  end
end
