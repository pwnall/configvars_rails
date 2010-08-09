require File.expand_path('../test_helper', __FILE__)

require 'configvars_rails/generators/templates/config_vars_controller.rb'

# Run the tests in the generator, to make sure they pass.
require 'configvars_rails/generators/templates/config_vars_controller_test.rb'

# Tests the methods injected by config_vars_controller.
class ConfigVarsControllerApiTest < ActionController::TestCase
  tests ConfigVarsController

  setup do
    @config_var = config_vars(:app_uri)
    request.env['HTTP_AUTHORIZATION'] = encode_credentials('config', 'vars')
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_vars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_var" do
    attributes = @config_var.attributes.merge 'name' => 'other_uri'
    assert_difference('ConfigVar.count') do
      post :create, :config_var => attributes
    end

    assert_redirected_to config_var_path(assigns(:config_var))
  end

  test "should show config_var" do
    get :show, :id => @config_var.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @config_var.to_param
    assert_response :success
  end

  test "should update config_var" do
    put :update, :id => @config_var.to_param,
                 :config_var => @config_var.attributes
    assert_redirected_to config_var_path(assigns(:config_var))
  end

  test "should destroy config_var" do
    assert_difference('ConfigVar.count', -1) do
      delete :destroy, :id => @config_var.to_param
    end

    assert_redirected_to config_vars_path
  end
  
  # Verbatim, from ActiveController's own unit tests.
  def encode_credentials(username, password)
    "Basic #{ActiveSupport::Base64.encode64("#{username}:#{password}")}"
  end  
end
