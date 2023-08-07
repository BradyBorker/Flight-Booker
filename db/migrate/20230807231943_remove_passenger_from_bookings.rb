class RemovePassengerFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :passenger, null: false, foreign_key: false
  end
end
