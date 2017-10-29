class AddFactToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :fact, :string
  end
end
