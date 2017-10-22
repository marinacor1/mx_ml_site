class RsvpController < ApplicationController

  def show
    @guest = current_user
  end
end
