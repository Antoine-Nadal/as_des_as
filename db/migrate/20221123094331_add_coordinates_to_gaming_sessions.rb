class AddCoordinatesToGamingSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :gaming_sessions, :latitude, :float
    add_column :gaming_sessions, :longitude, :float
  end
end
