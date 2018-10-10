class DropRidesUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rides_users
  end
end
