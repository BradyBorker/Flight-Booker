class FlightsController < ApplicationController
    def index
        @flight = Flight.new
        @available_flights = Flight.available_flights(params[:flight]) if params.key?(:flight)
    end
end
