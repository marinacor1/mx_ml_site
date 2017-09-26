class AddRoleToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :role, :string
  end
end
