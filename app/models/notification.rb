# frozen_string_literal: true

class Notification < ApplicationRecord
  before_save :normalize_details

  private

  def normalize_details
    self.details = details.map(&:to_h) if details.is_a?(Array)
  end
end
