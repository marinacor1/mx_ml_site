class GuestController < ApplicationController

  def edit
    @guest = current_user
    @query_guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
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
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name1, :first_name2, :last_name1, :last_name2, :code, :food_option1, :food_option2, :housing, :food_restrictions)
  end
end
