class GuestController < ApplicationController

  def edit
    @guest = current_guest
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      attending_check(params['guest']['attending'])
      flash[:error] = 'Success! Your RSVP has updated.'
    else
      flash[:error] = 'Your RSVP could not be updated. Please check your input and try again.'
    end
    redirect_to welcome_path
  end

  def show
    @guest = Guest.new(guest_params)
  end

  def index
    @guests = Guest.all
    @yes_guests = Guest.all.where(rsvped: true)
    @no_guests = Guest.all.where(rsvped: false)
  end

  private

  def guest_params
    params.require(:guest).permit(:code, :housing, :attending, :rsvped, :fact, :email, :friday_attending)
  end

  def attending_check(status)
    if status == 'Yes'
      @guest.attending = true
    elsif status == 'No'
      @guest.attending = false
    end
    @guest.rsvped = true
    @guest.save
  end
end
