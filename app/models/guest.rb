class Guest < ActiveRecord::Base

  def admin?
    role == 'Admin'
  end

  def self.attending_options
    ['Yes', 'No']
  end

  def self.housing_options
    ['Hotel', 'Airbnb', 'I live in Mexico City.']
  end

  def self.food_options
    ['Chicken', 'Beef', 'Fish']
  end

  def family?
    valid_roles = ['Admin', 'baf', 'family']
    valid_roles.include?(role)
  end

end
