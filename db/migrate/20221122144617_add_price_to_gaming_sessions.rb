class AddPriceToGamingSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :gaming_sessions, :price, :integer
  end
end
