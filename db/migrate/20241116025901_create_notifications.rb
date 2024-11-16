# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.bigint :user_id, null: false
      t.string :title, null: false
      t.text :message, null: false
      t.boolean :read, default: false
      t.timestamps
    end

    add_index :notifications, :user_id
  end
end
