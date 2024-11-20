# frozen_string_literal: true

class ChangeDetailsToJson < ActiveRecord::Migration[7.1]
  def up
    change_column :notifications, :details, :json
  end

  def down
    change_column :notifications, :details, :text
  end
end
