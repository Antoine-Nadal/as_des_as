class AddColumnsToGamingSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :gaming_sessions, :name, :string
  end
end
