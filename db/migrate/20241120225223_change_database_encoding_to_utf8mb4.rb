# frozen_string_literal: true

class ChangeDatabaseEncodingToUtf8mb4 < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      ALTER DATABASE #{ActiveRecord::Base.connection.current_database} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    SQL
  end

  def down
    execute <<-SQL
      ALTER DATABASE #{ActiveRecord::Base.connection.current_database} CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end
end
