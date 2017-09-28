require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :null_session
  before_action :authorize!
  helper_method :current_guest

  def current_guest
    #TODO session not yet loaded
    @current_guest ||= Guest.find(session[:guest_id]) if session['guest_id']
  end

  def current_permission
    @current_permission ||= PermissionsService.new(current_guest, params[:controller], params[:action])
  end

  def authorize!
    unless current_permission.allow?
      redirect_to login_path
    end
  end
end
