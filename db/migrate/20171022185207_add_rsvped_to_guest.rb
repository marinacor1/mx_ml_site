class AddRsvpedToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :rsvped, :boolean, default: false
  end
end
