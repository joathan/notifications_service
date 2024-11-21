# frozen_string_literal: true

class NotificationBroadcastService
  def self.broadcast_to_user(user_id, notification)
    ActionCable.server.broadcast(
      "notifications_#{user_id}",
      notification
    )
  end
end
