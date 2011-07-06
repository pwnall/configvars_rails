require 'action_controller'

# :nodoc: add config_vars_auth ro ActiveController class methods
class ActionController::Base
  # HTTP Basic for controller actions, using config_vars credentials.
  def self.config_vars_auth(*args)
    include ConfigvarsRails::AuthInstanceMethods
    before_filter :config_vars_http_basic_check, *args
  end
end

# :nodoc: namespace
module ConfigvarsRails

# Included in controllers that call config_vars_controller.
module AuthInstanceMethods
  def config_vars_http_basic_check
    authenticate_or_request_with_http_basic(
        ConfigVar['config_vars.http_realm']) do |user, password|
      user == ConfigVar['config_vars.http_user'] &&
          password == ConfigVar['config_vars.http_password']
    end
  end
  private :config_vars_http_basic_check
end  # module ConfigvarsRails::AuthInstanceMethods

end  # namespace ConfigvarsRails
