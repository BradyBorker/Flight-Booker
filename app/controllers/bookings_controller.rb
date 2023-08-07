class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end

    def create
        @booking = Booking.new
        @booking.flight = Flight.find(params[:flight][:id])
        
        params[:passenger].each do |passenger|
            @passenger = Passenger.find_or_create_by(name: passenger[:name], email: passenger[:email])
            @passenger << @booking
            @passenger.save!
        end
    end

    def show
    end

    private

    def booking_params
        params.require(:booking).permit(flight: [:id, :date, :departure_airport, :arrival_airport],
                                        passenger: [:id, :name, :email])
    end
end
