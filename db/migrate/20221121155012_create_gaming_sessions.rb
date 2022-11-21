class CreateGamingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :gaming_sessions do |t|
      t.string :address
      t.string :game
      t.integer :number_of_participants
      t.references :user, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
