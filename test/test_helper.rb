require 'rubygems'
require 'test/unit'

require 'action_pack'
require 'active_record'
require 'active_support'

require 'sqlite3'

require 'configvars_rails'

require 'helpers/view_helpers.rb'
# NOTE: application_controller has to follow view_helpers
require 'helpers/application_controller.rb'
require 'helpers/auth_test_controller.rb'
require 'helpers/db_setup.rb'
require 'helpers/initializers.rb'
require 'helpers/routes.rb'
require 'helpers/rails.rb'
