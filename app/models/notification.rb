# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :user_id, :title, :message, presence: true
end
