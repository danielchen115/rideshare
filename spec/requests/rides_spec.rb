# spec/requests/rides_spec.rb

require 'rails_helper'

RSpec.describe 'Rides API', type: :request do
  # add rides owner
  let(:user) { create(:user) }
  # initialize test data
  let!(:rides) { create_list(:ride, 10) }
  let(:ride_id) { rides.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /rides
  describe 'GET /rides' do
    # update request with headers
    # make HTTP get request before each example
    before { get "/rides", params: {}, headers: headers }

    it 'returns rides' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /rides/:id
  describe 'GET /rides/:id' do
    before { get "/rides/#{ride_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the ride' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(ride_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:ride_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ride with 'id'=100/)
      end
    end
  end

  # Test suite for POST /rides
  describe 'POST /rides' do
    # valid payload
    let(:valid_attributes) do
      {
        origin: 'Toronto',
        destination: 'Waterloo',
        leave_at: DateTime.current.to_formatted_s(:db),
        arrive_at: DateTime.current.advance(:hours => +3).to_formatted_s(:db),
        price: 23.45,
        seats: 4,
        details: 'Coffee breaks included!',
        required_seats: 1
      }.to_json
    end

    context 'when the request is valid' do
      before { post '/rides', params: valid_attributes, headers: headers }
      it 'creates a ride' do
        expect(json['origin']).to eq('Toronto')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { origin: nil }.to_json }
      before { post '/rides', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
            .to match(/Validation failed: Origin can't be blank, Destination can't be blank, Leave at can't be blank, Arrive at can't be blank, Price can't be blank, Seats can't be blank/)
      end
    end
  end

  # Test suite for PUT /rides/:id
  describe 'PUT /rides/:id' do
    let(:valid_attributes) { { origin: 'Barrie' }.to_json }

    context 'when the record exists' do
      before { put "/rides/#{ride_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /rides/:id
  describe 'DELETE /rides/:id' do
    before { delete "/rides/#{ride_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
