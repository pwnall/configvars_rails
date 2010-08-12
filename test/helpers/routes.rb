# :nodoc: the routes used in all tests
class ActionController::TestCase
  def setup_routes
    @routes = ActionController::Routing::RouteSet.new
    @routes.draw do
      # NOTE: this route should be kept in sync with the config_vars template.
      config_vars
    end
    ApplicationController.send :include, @routes.url_helpers
  end
  
  setup :setup_routes
end
