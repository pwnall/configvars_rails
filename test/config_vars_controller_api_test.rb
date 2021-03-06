require File.expand_path('../test_helper', __FILE__)

require 'configvars_rails/generators/templates/config_vars_controller.rb'

# Run the tests in the generator, to make sure they pass.
require 'configvars_rails/generators/templates/config_vars_controller_test.rb'

# Tests the methods injected by config_vars_controller.
class ConfigVarsControllerApiTest < ActionController::TestCase
  tests ConfigVarsController

  setup do
    @config_var = config_vars(:app_uri)
    request.env['HTTP_AUTHORIZATION'] =
        ActionController::HttpAuthentication::Basic.encode_credentials('config',
                                                                       'vars')
  end

  test "should get index" do
    get :index
    assert_response :success

    assert assigns(:config_vars).include?(config_vars(:app_uri)),
           "@config_vars doesn't have a database fixture"
    assert assigns(:default_vars).map(&:first).
                                  include?('config_vars.http_user'),
           "@default_vars doesn't have config_vars:http_user"
    assert_select 'meta[name="csrf-token"]', nil, 'Missing CSRF token'
  end

  test "should get variable value" do
    get :show, name: @config_var.to_param
    assert_response :success
    assert_equal @config_var.value, @response.body
  end

  test "edit with preset name and default value" do
    get :edit, name: 'config_vars.http_user'
    assert_response :success
    assert_equal 'config_vars.http_user', assigns(:config_var).name
    assert_equal 'config', assigns(:config_var).value
  end

  test "should create config_var" do
    attributes = @config_var.attributes.merge 'name' => 'other_uri'
    assert_difference('ConfigVar.count') do
      put :update, config_var: attributes
    end

    assert_redirected_to config_vars_url
    assert_equal ConfigVar['other_uri'], @config_var.value
  end

  test "should get edit" do
    get :edit, name: @config_var.to_param
    assert_response :success
    assert_select 'form[action$=/config_vars]'
  end

  test "should update config_var" do
    put :update, config_var: @config_var.attributes
    assert_redirected_to config_vars_url
  end

  test "should destroy config_var" do
    assert_difference('ConfigVar.count', -1) do
      delete :destroy, name: @config_var.to_param
    end

    assert_redirected_to config_vars_url
  end

  test "cannot access config vars without authentication" do
    request.env.delete 'HTTP_AUTHORIZATION'
    get :index
    assert_response :unauthorized
  end
end
