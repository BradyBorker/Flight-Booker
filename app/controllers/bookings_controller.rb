class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_selected])
        @passengers = params[:passenger_count].to_i.times.map { Passenger.new }
    end

    def create
        @flight = Flight.find(params[:booking][:flight_id])
        @booking = @flight.bookings.create!(booking_params)

        if @booking
            @booking.passengers.each do |passenger|
                PassengerMailer.with(passenger: passenger, flight_id: @flight.id).confirmation_email.deliver_later
            end

            redirect_to booking_path(@booking)
        else
            render :new, status: :unprocessable_entity
        end

    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
