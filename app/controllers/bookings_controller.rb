class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end
end
