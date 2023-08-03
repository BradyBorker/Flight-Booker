# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
['LAX', 'ATL', 'ORD', 'JFK', 'TPA', 'PHX', 'SEA'].each { |code| Airport.create(airport_code: code) }

Flight.destroy_all
Airport.all.map { |airport| airport }.combination(2).each do |departing_arrival_combos|
    seed_number = rand(1..10)
    date_time = Time.now + (seed_number * 86_400)

    flight = Flight.new(start: date_time, flight_duration: seed_number)
    flight.departure_airport = departing_arrival_combos[0]
    flight.arrival_airport = departing_arrival_combos[1]
    flight.save!
end
