class Guest < ActiveRecord::Base
  # scope :admin, -> { where(role: 'Admin')}

  def admin?
    true
  end

end
