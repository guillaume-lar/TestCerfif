class ChangeReservation < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :date, :datetime
    add_column :reservations, :start_of_reservation, :date
    add_column :reservations, :end_of_reservation, :date
 end
end
