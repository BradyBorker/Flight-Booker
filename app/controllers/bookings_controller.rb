class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end

    def create
        @flight = Flight.find(params[:booking][:flight_id])
        @booking = @flight.bookings.create!(booking_params)

        redirect_to booking_path(@booking)
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
