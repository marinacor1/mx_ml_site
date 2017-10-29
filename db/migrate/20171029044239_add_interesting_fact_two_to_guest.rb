class AddInterestingFactTwoToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :interesting_fact_two, :string
  end
end
