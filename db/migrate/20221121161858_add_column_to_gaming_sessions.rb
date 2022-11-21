class AddColumnToGamingSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :gaming_sessions, :description, :text
  end
end
