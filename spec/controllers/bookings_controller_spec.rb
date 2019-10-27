require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET bookings#index' do
    it 'loads index' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'POST bookings#create' do
    it 'creates new booking' do
      post :create, params: { booking: 
                            { name: "Test",
                              email: "example@abc.com",
                              category: "electronics",
                              items: "camera",
                              quantity: 10 }}
    end 
  end
end
