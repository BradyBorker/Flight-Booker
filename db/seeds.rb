# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def random_time
    rand(Time.now - 1.day..Time.now)
end

Airport.destroy_all
['LAX', 'ATL', 'ORD', 'JFK', 'TPA', 'PHX', 'SEA'].each { |code| Airport.create(airport_code: code) }

Flight.destroy_all
(Date.today - 10..Date.today).each do |date|
    Airport.all.each do |origin|
        Airport.all.each do |destination|
            next if origin == destination

            3.times do
                flight = Flight.new(date: date, time: random_time, flight_duration: rand(60.0).ceil(2))
                flight.departure_airport = origin
                flight.arrival_airport = destination
                flight.save!
            end
        end
    end
end
