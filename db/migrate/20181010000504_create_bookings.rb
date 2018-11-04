class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ride, index: true
      t.string :type
      t.integer :required_seats

      t.timestamps
    end
  end
end
