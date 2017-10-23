class RemoveFoodRestrictionsFromGuest < ActiveRecord::Migration
  def change
    remove_column :guests, :food_restrictions
    remove_column :guests, :logged_in
  end
end
