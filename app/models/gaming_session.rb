class GamingSession < ApplicationRecord
  belongs_to :user
  validates :address, :date, :name, :number_of_participants, presence: true
end
