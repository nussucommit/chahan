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
    to_hash(params[:_json])
  end

  def to_hash(hashes)
    result = Hash.new
    
    hashes.each do |d|
      unless d['name'] == 'g-recaptcha-response'
        key = d['name'].sub('id:', '')
                       .sub('ItemQuantity', 'quantity')
                       .sub('PurposeofRental', 'purpose')
        value = d['value'] 
        if key == 'category'
          value = value.downcase
        end

        result[key] = value
      end
    end

    return result
  end
end
