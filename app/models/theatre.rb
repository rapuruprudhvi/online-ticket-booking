class Theatre < ApplicationRecord
    has_many :bookings
    has_many :movies, through: :bookings
  end
  