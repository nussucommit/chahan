require 'rails_helper'

RSpec.describe BookingsController, type: :controller do

  describe 'GET bookings#index' do
    it 'redirects to login page if user not logged in' do
      get :index
      expect redirect_to new_user_session_path
    end

    before do
      @user = create(:user)
      @signed_in = sign_in (@user)
    end

    it 'loads index if user is logged in' do
      get :index
      expect(@signed_in).to be_truthy
      expect(response).to render_template("index")
    end

    it 'redirects to login page if previously logged in user has logged out' do
      sign_out (@user)
      get :index
      expect redirect_to new_user_session_path
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
      sign_in create(:user)
      @booking = create :booking
    end

    it 'changes booking status' do
      expect do
        patch :update, params: { id: @booking.id, status: 'approved' }
      end.to change { Booking.find(@booking.id).status }
        .to('approved')
      should redirect_to bookings_path
      expect(flash[:notice]).to eql('Updated booking status')
    end

    it 'does nothing if blank status passed for update' do
      patch :update, params: { id: @booking.id, status: '' }
      should redirect_to bookings_path
      expect(flash[:alert]).to eql("Failed to update booking status")
    end

    it 'raises error if invalid status passed for update' do
      expect do
        patch :update, params: { id: @booking.id, status: 'huh' }
      end.to raise_error(ArgumentError)
    end
  end

  describe 'DELETE devise/sessions#destroy' do
    pending "implement test for Logout button click, or remove this line #{__FILE__}" 
  end

end
