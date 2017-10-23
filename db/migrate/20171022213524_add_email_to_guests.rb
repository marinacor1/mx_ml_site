class AddEmailToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :email, :string
    add_column :guests, :attending, :boolean
  end
end
