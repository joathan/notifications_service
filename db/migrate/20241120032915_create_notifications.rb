
# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :title
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end
