class PermissionsService
  extend Forwardable

  def_delegators :guest,
                 :family?,
                 :bridesmaid?,
                 :bridesmaid_and_family?,
                 :admin?

  def initialize(user, controller, action)
    @a_user = user || User.new
    @_controller = controller
    @_action = action
  end

  def allow?
    case
    when admin? then admin_permissions
    when bridesmaid_and_family? then bridesmaid_and_family_permissions
    when family? then family_permissions
    when bridesmaid? then bridesmaid_permissions
    when registered_guest? then guest_permissions
    else
      unregistered_guest_permissions
    end
  end

  private

  def admin_permissions
    return true if controller = 'welcome'
    return true if controller = 'sessions'
    return true if controller == 'bridesmaids' && action.in?(%w( index show edit update))
    return true if controller == 'family'
    return true if controller == 'guest' && action.in?(%w( index show edit update))
    return true if controller == 'itinerary'
    return true if controller == 'lodging'
    return true if controller == 'mexico'
    return true if controller == 'our_story'
    return true if controller == 'schedule'
    return true if controller = 'connected'
  end

  def family_permissions
    return true if controller = 'welcome'
    return true if controller = 'sessions'
    return true if controller == 'family'
    return true if controller == 'guest' && action.in?(%w(show edit update))
    return true if controller == 'itinerary'
    return true if controller == 'lodging'
    return true if controller == 'mexico'
    return true if controller == 'our_story'
    return true if controller == 'schedule'
    return true if controller = 'connected'

  end

  def bridesmaid_permissions
    return true if controller = 'welcome'
    return true if controller = 'sessions'
    return true if controller == 'bridesmaids' && action.in?(%w(show edit update))
    return true if controller == 'guest' && action.in?(%w(show edit update))
    return true if controller == 'itinerary'
    return true if controller == 'lodging'
    return true if controller == 'mexico'
    return true if controller == 'our_story'
    return true if controller == 'schedule'
    return true if controller = 'connected'
  end

  def bridesmaid_and_family_permissions
    return true if controller = 'welcome'
    return true if controller = 'sessions'
    return true if controller == 'bridesmaids' && action.in?(%w(show edit update))
    return true if controller == 'family'
    return true if controller == 'guest' && action.in?(%w(show edit update))
    return true if controller == 'itinerary'
    return true if controller == 'lodging'
    return true if controller == 'mexico'
    return true if controller == 'our_story'
    return true if controller == 'family_schedule'
    return true if controller = 'connected'
  end

  def registered_guest_permissions
    return true if controller = 'welcome'
    return true if controller = 'sessions'
    return true if controller == 'guest' && action.in?(%w(show edit update))
    return true if controller == 'itinerary'
    return true if controller == 'lodging'
    return true if controller == 'mexico'
    return true if controller == 'our_story'
    return true if controller == 'schedule'
    return true if controller = 'connected'
  end

  def unregistered_guest_permissions
    return true if controller = 'welcome'
    return true if controller == "sessions" && action == "new"
    return true if controller == "sessions" && action == "create"
    return true if controller == "sessions" && action == "destroy"
    return true if controller = 'connected'
  end

  def controller
    @_controller
  end

  def action
    @_action
  end

  def user
    @_user
  end
end
