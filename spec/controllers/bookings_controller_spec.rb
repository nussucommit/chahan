require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET bookings#index' do
    before do
      sign_in create(:user)
    end

    it 'loads index' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'POST bookings#create' do
    # No signing in because we should be able to send POST request without authentication
    it 'creates new booking' do
      post :create, params: { _json: [
                                        {name: 'id:name', value: 'Test'},
                                        {name: 'id:email', value: 'example@abc.com'},
                                        {name: 'category', value: 'electronics'},
                                        {name: 'items', value: 'camera'},
                                        {name: 'ItemQuantity', value: '10'},
                                        {name: 'PurposeofRental', value: "Test\r\nMultiline"}
                                     ],
                              booking: {} }

      expect(Booking.exists?(name: 'Test', 
                             email: 'example@abc.com',
                             category: 'electronics',
                             items: 'camera',
                             quantity: 10,
                             purpose: "Test\r\nMultiline")).to be true

    end 
  end

  describe 'PATCH bookings#update' do
    before do
      @booking = create :booking
    end

    it 'changes booking status' do
      expect do
        patch :update, params: { id: @booking.id, status: 'approved' }
      end.to change { Booking.find(@booking.id).status }
        .to('approved')
      should redirect_to bookings_path
    end
  end
end
