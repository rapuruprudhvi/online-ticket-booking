# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre

  validates :seat_number, presence: true, uniqueness: { scope: :theatre_id, message: "seat already booked in this theatre" }
end
