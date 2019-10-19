require 'rails_helper'
require 'webmock/rspec'

RSpec.describe BookingsHelper, type: :helper do
  describe '#get_request' do
    it 'creates booking' do
      file = File.read('sample-data.json')
      stub_request(:get, 'http://www.killmepls.com').
        to_return(body: file)

      get_request
      expect(Booking.exists?( name: 'John Doe', 
                              email: 'test@example.com',
                              category: 'electronics',
                              items: 'Portable Projector',
                              #purpose: 'Test\r\nMultiline',
                              quantity: 1)).to be true
    end
  end
end