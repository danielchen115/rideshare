class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :update, :destroy]
  # GET /rides
  def index
    # get all rides
    @rides = Ride.paginate(page: params[:page], per_page: 10)
    json_response(@rides)
  end

  # POST /rides
  def create
    @ride = Ride.create!(ride_params)
    current_user.bookings.create!(required_seats: params[:required_seats], role: 'driver', ride_id: @ride.id)
    json_response(@ride, :created)
  end

  # GET /rides/:id
  def show
    json_response(@ride)
  end

  # PUT /rides/:id
  def update
    @ride.update(ride_params)
    head :no_content
  end

  # DELETE /rides/:id
  def destroy
    @ride.destroy
    head :no_content
  end

  private

  def ride_params
    # whitelist params
    params.require(:ride).permit(:id, :origin, :destination, :arrive_at, :leave_at, :price, :seats, :details, :required_seats)
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end
end
