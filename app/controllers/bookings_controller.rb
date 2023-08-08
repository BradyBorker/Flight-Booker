class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end

    def create
        @flight = Flight.find(params[:flight][:id])
        @booking = @flight.bookings.create!

        params[:passengers].each do |passenger|
            @booking.passengers << Passenger.new(name: passenger[:name], email: passenger[:email])
        end

        redirect_to booking_path(@booking)
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(flight: [:id, :date, :departure_airport, :arrival_airport],
                                        passengers: [:id, :name, :email])
    end
end
