class AddTypeToRidesUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :rides_users, :type, :string
  end
end
