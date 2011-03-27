class AuthTestController < ApplicationController
  config_vars_auth
  
  prepend_view_path File.expand_path('../views', __FILE__)
  
  def index
  end
end
