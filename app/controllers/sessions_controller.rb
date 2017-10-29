class SessionsController < ApplicationController
  def new
  end

  def create
    @guest = Guest.find_by(code: params[:session][:code])
    if @guest
      session[:guest_id] = @guest.id
      @guest.role = "guest"
      redirect_to welcome_path if current_permission
    else
      flash[:error] = 'Check your code and try again.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
