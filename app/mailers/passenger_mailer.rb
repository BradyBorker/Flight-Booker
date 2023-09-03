class PassengerMailer < ApplicationMailer
    def confirmation_email
        @passenger = params[:passenger]
        @booking_id = params[:booking_id]

        mail(to: @passenger.email, subject: 'Booking Information')
    end
end
