# Fake application.
module ConfigVarsApp
  class Application
  end
end

# Mock Rails.application used in the config_vars layout.
#
# This mocks Rails for ConfigVars classes, but not for everything else.
module ConfigVarsHelper
  module Rails
    def self.application
      ConfigVarsApp::Application.new
    end
  end
end

# For javascript_include_tag in the config_vars layout.
ActionController::Base.config.assets_dir = '.'
ActionController::Base.config.javascripts_dir = '.'

if ActionView::Helpers::AssetTagHelper.respond_to?(:register_javascript_expansion)
  # Rails 3.
  ActionView::Helpers::AssetTagHelper.
      register_javascript_expansion(defaults: ['rails.js'])
else
  # Rails 4 doesn't seem to need anything.
end
