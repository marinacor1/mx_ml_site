class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name1
      t.string :last_name1
      t.string :first_name2
      t.string :last_name2
      t.string :code
      t.string :food_option1
      t.string :food_option2
      t.string :housing
      t.string :food_restrictions
      t.boolean :logged_in, :default => false

      t.timestamps null: false
    end
  end
end
