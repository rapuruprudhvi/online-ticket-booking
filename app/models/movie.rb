class Movie < ApplicationRecord
    has_many :bookings
    has_many :theatres, through: :bookings
  end