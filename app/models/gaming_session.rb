class GamingSession < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :address, :date, :name, :number_of_participants, presence: true
end
