class Guest < ActiveRecord::Base

  def admin?
    true
  end

  def self.attending_options
    ['Yes', 'No']
  end

  def self.housing_options
    ['Hotel', 'Airbnb', 'I live in Mexico City.']
  end

end
