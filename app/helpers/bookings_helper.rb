require 'json'
require 'net/http'

module BookingsHelper
  def get_request
    uri = URI("http://www.example.com")
    res =  Net::HTTP.get(uri)
    request = JSON.parse(res)
    request = to_hash(request)

    Booking.create( name: request["id:name"], 
                    email: request["id:email"], 
                    category: request["category"].downcase,
                    items: request["items"],
                    quantity: request["ItemQuantity"],
                    purpose: request["PurposeofRental"])
  end

  def to_hash(hashes)
    result = Hash.new
    
    hashes.each do |d|
      unless d["name"] == "g-recaptcha-response"
        result[d["name"]] = d["value"]
      end
    end

    return result
  end
end
