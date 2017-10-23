class Guest < ActiveRecord::Base
  # scope :admin, -> { where(role: 'Admin')}

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
