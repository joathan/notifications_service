# frozen_string_literal: true

module Api
  module V1
    class NotificationsController < ApplicationController
      def create
        notification = Notification.new(notification_params)

        if notification.save
          render json: { message: "Notification received successfully", id: notification.id }, status: :created
        else
          render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def notification_params
        params.require(:notification).permit(:task_id, :user_id, :title, :details, :status)
      end
    end
  end
end
