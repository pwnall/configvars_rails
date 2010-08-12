# :nodoc: namespace
module ConfigvarsRails
end

require 'configvars_rails/controller.rb'
require 'configvars_rails/descriptor.rb'
require 'configvars_rails/model.rb'
require 'configvars_rails/routes.rb'

if defined?(Rails)
  require 'configvars_rails/engine.rb'

  # HACK(costan): this works around a known Rails bug
  #     https://rails.lighthouseapp.com/projects/8994/tickets/1905-apphelpers-within-plugin-not-being-mixed-in
  require File.expand_path('../../app/helpers/config_vars_helper.rb', __FILE__)
  ActionController::Base.helper ConfigVarsHelper
end
