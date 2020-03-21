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
      if @booking.status == 'rejected'
        redirect_to select_email_templates_path(booking_id: @booking.id),
                    notice: "Succesfully rejected booking, please select email template"

      elsif @booking.status == 'approved'
        redirect_to select_email_templates_path(booking_id: @booking.id),
                    notice: "Succesfully approved booking, please select email template"
      end
    else
      redirect_to bookings_path,
                  alert: "Failed to update booking status"
    end
  end

private
  def booking_params
    to_hash('[' + get_param_values + ']')
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

    return init_status result
  end

  def init_status(params)
    params[:status] = 'pending'

    params
  end

  def get_param_values()
    hash_to_be_filtered = params.to_unsafe_h
    denilized_hash = denilize(hash_to_be_filtered, 'values')
    reversed_hash = denilized_hash.invert
    params_to_be_filtered = ActionController::Parameters.new(reversed_hash)

    filtered_params = params_to_be_filtered.require(:values)
  end

  def denilize(h, nil_replacement)
    h.each_with_object({}) { |(k,v),g|
      g[k] = (Hash === v) ?  denilize(v) : v.blank? ? nil_replacement : v }
  end
end
