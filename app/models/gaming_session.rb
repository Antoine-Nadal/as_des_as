class GamingSession < ApplicationRecord
  belongs_to :user
  validates :address, :name, :number_of_participants, presence: true
end
