class GamingSession < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :address, :name, :number_of_participants, :price, presence: true
end
