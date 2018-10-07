class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.datetime :leave_at
      t.datetime :arrive_at
      t.decimal :price
      t.integer :seats
      t.text :details

      t.timestamps
    end
  end
end
