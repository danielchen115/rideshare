# spec/requests/bookings_spec.rb

require 'rails_helper'

RSpec.describe 'Bookings API', type: :request do
  # add bookings owner
  let(:user) { create(:user) }
  # add bookings ride
  let(:ride) {create(:ride)}
  let(:ride_id) {ride.id}
  # initialize test data
  let!(:bookings) { create_list(:booking, 10) }
  let(:booking_id) { bookings.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /bookings
  describe 'GET /rides/:ride_id/bookings' do
    # update request with headers
    # make HTTP get request before each example
    before { get "/rides/#{ride_id}/bookings", params: {}, headers: headers }

    it 'returns bookings' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /bookings/:id
  describe 'GET /rides/:ride_id/bookings/:id' do
    before { get "/rides/#{ride_id}/bookings/#{booking_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the booking' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(booking_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:booking_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking with 'id'=100/)
      end
    end
  end

  # Test suite for POST /bookings
  describe 'POST /rides/:ride_id/bookings' do
    # valid payload
    let(:valid_attributes) do
      {
          role: 'driver',
          required_seats: 4
      }.to_json
    end

    context 'when the request is valid' do
      before { post "/rides/#{ride_id}/bookings", params: valid_attributes, headers: headers }
      it 'creates a booking' do
        expect(json['role']).to eq('driver')
        expect(json['required_seats']).to eq(4)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { role: nil }.to_json }
      before { post "/rides/#{ride_id}/bookings", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
            .to match(/Role can't be blank, Required seats can't be blank/)
      end
    end
  end

  # Test suite for PUT /bookings/:id
  describe 'PUT /rides/:ride_id/bookings/:id' do
    let(:valid_attributes) { { role: 'driver' }.to_json }

    context 'when the record exists' do
      before { put "/rides/#{ride_id}/bookings/#{booking_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /bookings/:id
  describe 'DELETE /rides/:ride_id/bookings/:id' do
    before { delete "/rides/#{ride_id}/bookings/#{booking_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
