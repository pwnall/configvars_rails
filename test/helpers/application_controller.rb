# :nodoc: stubbed, because controllers inherit from it
class ApplicationController < ActionController::Base
  layout 'application'
  
  prepend_view_path File.expand_path(
      '../../../lib/configvars_rails/generators/templates', __FILE__)
end
