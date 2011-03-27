require File.expand_path('../test_helper', __FILE__)


# Tests the methods injected by config_vars_controller.
class ConfigVarsAuthApiTest < ActionController::TestCase
  tests AuthTestController

  setup do
    @config_var = config_vars(:app_uri)
    request.env['HTTP_AUTHORIZATION'] =
        ActionController::HttpAuthentication::Basic.encode_credentials('config',
                                                                       'vars')
  end

  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "index should render with application layout" do
    get :index
    assert_select 'h1', 'Application Layout'
  end

  test "cannot access action without authentication" do
    request.env.delete 'HTTP_AUTHORIZATION'
    get :index
    assert_response :unauthorized    
  end
end
