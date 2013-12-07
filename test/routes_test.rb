require File.expand_path('../test_helper', __FILE__)

require 'configvars_rails/generators/templates/config_vars_controller.rb'


class RoutesTest < ActionController::TestCase
  tests ConfigVarsController

  test "config_vars routes" do
    assert_routing({path: "/config_vars", method: :get},
                   {controller: 'config_vars', action: 'index'})
    assert_routing({path: "/config_vars/http.user", method: :get},
                   {controller: 'config_vars', action: 'show',
                    name: 'http.user'})
    assert_routing({path: "/config_vars", method: :put},
                   {controller: 'config_vars', action: 'update'})
    assert_routing({path: "/config_vars/http.user", method: :delete},
                   {controller: 'config_vars', action: 'destroy',
                    name: 'http.user'})
    assert_routing({path: "/config_vars/http.user/edit", method: :get},
                   {controller: 'config_vars', action: 'edit',
                    name: 'http.user'})
  end
end
