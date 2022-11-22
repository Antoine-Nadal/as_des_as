class GamingSession < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  validates :address, :name, :number_of_participants, presence: true
end
