class FlightsController < ApplicationController
    def index
        @flight = Flight.new
        @flight_dates = Flight.distinct_dates
    end
end
