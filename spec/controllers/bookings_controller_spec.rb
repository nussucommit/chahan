require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET bookings#index' do
    it 'loads index' do
      get :index
      expect(response).to render_template("index")
    end
  end
end