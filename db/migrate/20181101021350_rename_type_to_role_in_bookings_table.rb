class RenameTypeToRoleInBookingsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :type, :role
  end
end
