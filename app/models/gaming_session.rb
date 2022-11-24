class GamingSession < ApplicationRecord
  GAMES_TYPES = ["Jeux de cartes", "Jeux de société", "Billard", "Fléchettes", "Lancer de hâches", "Jeux de dés"]
  validates :game_type, inclusion: { in: GAMES_TYPES }
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :address, :name, :number_of_participants, :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
