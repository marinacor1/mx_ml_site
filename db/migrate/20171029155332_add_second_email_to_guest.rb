class AddSecondEmailToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :second_email, :string
  end
end
