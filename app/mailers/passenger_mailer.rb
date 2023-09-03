class PassengerMailer < ApplicationMailer
    def confirmation_email
        @passenger = params[:passenger]
        @flight_id = params[:flight_id]

        mail(to: @passenger.email, subject: 'Booking Information')
    end
end
