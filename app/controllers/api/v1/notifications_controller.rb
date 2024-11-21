# frozen_string_literal: true

module Api
  module V1
    class NotificationsController < ApplicationController
      def create
        notification = Notification.find_or_initialize_by(
          task_id: notification_params[:task_id],
          user_id: notification_params[:user_id]
        )

        notification.assign_attributes(
          title: notification_params[:title],
          status: notification_params[:status],
          details: JSON.parse(notification_params[:details].to_json)
        )

        if notification.save
          NotificationBroadcastService.broadcast_to_user(notification.user_id, notification) if notification.status == 'completed'

          render json: { message: "Notification received successfully", id: notification.id }, status: :created
        else
          render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def notification_params
        params.require(:notification).permit(:task_id, :user_id, :title, :status, details: [:label, :value])
      end
    end
  end
end
