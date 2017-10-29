class SessionsController < ApplicationController
  def new
  end

  def create
    @guest = Guest.find_by(code: params[:session][:code])
    if @guest
      session[:guest_id] = @guest.id
      @guest.role = "guest"
      if current_permission
        redirect_to welcome_path
      end
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
