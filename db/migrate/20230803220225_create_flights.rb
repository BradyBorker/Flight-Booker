class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false
      t.references :arrival_airport, null: false
      t.date :date 
      t.time :time
      t.float :flight_duration

      t.timestamps
    end
  end
end
