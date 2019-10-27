class BookingsController < ApplicationController
  # Disable authenticity token verification for now
  skip_before_action :verify_authenticity_token

  def index
    @bookings = Booking.all
  end

  def create
    booking = Booking.new booking_params

    if booking.save
      #placeholder
    else
      #placeholder
    end
  end

private
  def booking_params
    params.require(:booking).permit(:name, :email, :category, :items, :quantity, :purpose)
  end
end
