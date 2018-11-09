class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  # GET /ride/:ride_id/bookings
  def index
    # get current user bookings
    @bookings = Ride.find(params[:ride_id]).bookings.paginate(page: params[:page], per_page: 10)
    json_response(@bookings)
  end

  # POST /ride/:ride_id/bookings
  def create
    @booking = Booking.new(booking_params)
    @booking.ride_id = params[:ride_id]
    @booking.user_id = current_user.id
    @booking.save!
    json_response(@booking, :created)
  end

  # GET /ride/:ride_id/bookings/:id
  def show
    json_response(@booking)
  end

  # PUT /ride/:ride_id/bookings/:id
  def update
    @booking.update(booking_params)
    head :no_content
  end

  # DELETE /ride/:ride_id/bookings/:id
  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def booking_params
    # whitelist params
    params.require(:booking).permit(:id, :role, :required_seats, :user, :ride)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
