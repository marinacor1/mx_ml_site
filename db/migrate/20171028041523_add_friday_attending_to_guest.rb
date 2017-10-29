class AddFridayAttendingToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :friday_attending, :Boolean
  end
end
