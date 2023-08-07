class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end

    def create
    end

    def show
    end

    private

    def booking_params
        params.require(:booking).permit(flight: [:id, :date, :departure_airport, :arrival_airport],
                                        passenger: [:id, :name, :email])
    end
end
