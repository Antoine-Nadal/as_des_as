class AddAttributesToGamingSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :gaming_sessions, :game_type, :string
    add_column :gaming_sessions, :food, :boolean
    add_column :gaming_sessions, :drink, :boolean
  end
end
