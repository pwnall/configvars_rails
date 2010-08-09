require 'test_helper'

class ConfigVarsControllerTest < ActionController::TestCase
  setup do
    @config_var = config_vars(:app_uri)
  end
  
  test "cannot access config var without authentication" do
    get :show, :id => @config_var.to_param

    assert_response :unauthorized    
  end
end
