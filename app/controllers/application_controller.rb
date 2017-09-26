class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authorize!
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session['user_id']
  end

  def current_permission
    @current_permission ||= PermssionService.new(current_user, params[:controller], params[:action])
  end

  def authorize!
    unless current_permission.allow?
      redirect_to root_url
    end
  end
end
