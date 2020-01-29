class BookingsController < ApplicationController
  # Disable authenticity token verification for now
  before_action :authenticate_user!, :except => [:create]
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

  def update
    @booking = Booking.find(params[:id])

    if @booking.update status_param
      redirect_to bookings_path,
                  notice: "Updated booking status"
    else
      redirect_to bookings_path,
                  alert: "Failed to update booking status"
    end
  end

private
  def booking_params
    to_hash('[' + params.select{|k, v| v == nil}.keys[0] + ']')
  end

  def status_param
    params.permit(:status)
  end

  def to_hash(param)
    result = Hash.new
    hashes = JSON.parse(param)
    
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

  def init_status(params)
    params[:status] = 'pending'

    params
  end
end
