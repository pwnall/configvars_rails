# :nodoc: the routes used in all tests
class ActionController::TestCase
  def setup_routes
    if defined? ActionDispatch::Routing
      # Rails 4.
      @routes = ActionDispatch::Routing::RouteSet.new
    else
      # Rails 3.
      @routes = ActionController::Routing::RouteSet.new
    end
    @routes.draw do
      # NOTE: this route should be kept in sync with the config_vars template.
      config_vars
      get 'auth_test' => 'auth_test#index'
    end
    ApplicationController.send :include, @routes.url_helpers
  end

  setup :setup_routes
end
