class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :type
      t.integer :required_seats

      t.timestamps
    end
  end
end
