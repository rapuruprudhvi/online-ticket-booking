# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @movies = Movie.all
    @theatres = Theatre.all
  end

  def create
    movie_id = booking_params[:movie_id]
    theatre_id = booking_params[:theatre_id]
    seat_numbers = booking_params[:seat_numbers].split(',').map(&:strip).map(&:to_i)

    @theatre = Theatre.find(theatre_id)
    existing_seats = Booking.where(theatre: @theatre, seat_number: seat_numbers).pluck(:seat_number)
    available_seats = seat_numbers - existing_seats

    if existing_seats.any?
      redirect_to new_booking_path, alert: "The following seats are already booked: #{existing_seats.join(', ')}"
      return
    end

    if (Booking.where(theatre: @theatre).count + available_seats.size) > @theatre.capacity
      redirect_to new_booking_path, alert: 'Theatre does not have enough capacity for these bookings.'
      return
    end

    Booking.transaction do
      available_seats.each do |seat_number|
        Booking.create!(movie_id: movie_id, theatre_id: theatre_id, seat_number: seat_number)
      end
    end

    redirect_to movie_path(movie_id), notice: 'Bookings were successfully created.'
  end

  private

  def booking_params
    params.require(:booking).permit(:movie_id, :theatre_id, :seat_numbers)
  end
end
