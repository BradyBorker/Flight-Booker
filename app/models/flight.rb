class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  scope :distinct_dates, -> { distinct.select(:date).order(:date).distinct }
  scope :available_flights, ->(flight) { where(departure_airport: flight[:departure_airport_id], arrival_airport: flight[:arrival_airport_id], date: flight[:date]) }

  def flight_date_formatted
    date.strftime('%m/%d/%Y')
  end

  def flight_radio_formatted
    "#{departure_airport.airport_code} -> #{arrival_airport.airport_code} At #{time.strftime('%H:%M')}"
  end
end
