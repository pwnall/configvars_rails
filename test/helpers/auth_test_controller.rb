class AuthTestController < ApplicationController
  config_vars_auth
  
  def index
    render :text => ''
  end
end

