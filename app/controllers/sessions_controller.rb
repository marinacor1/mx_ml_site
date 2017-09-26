class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(code: params[:session][:code])
    if @user
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{@user.first_name1}!"
      @user.roles << Role.create(name: 'registered_guest')
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
