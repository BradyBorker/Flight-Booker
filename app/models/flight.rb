class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  scope :distinct_dates, -> { distinct.select(:date).order(:date).distinct }

  def flight_date_formatted
    date.strftime('%m/%d/%Y')
  end

  def self.available_flights(flight)
    Flight.where(departure_airport: flight[:departure_airport_id], arrival_airport: flight[:arrival_airport_id], date: flight[:date])
  end
end
