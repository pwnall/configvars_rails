ActiveRecord::Base.establish_connection :adapter => 'sqlite3',
                                        :database => ':memory:'
ActiveRecord::Base.configurations = true

ActiveRecord::Migration.verbose = false
require 'configvars_rails/generators/templates/001_create_config_vars.rb'
CreateConfigVars.up

require 'configvars_rails/generators/templates/config_var.rb'

# :nodoc: open TestCase to setup fixtures
class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  
  self.fixture_path =
      File.expand_path '../../../lib/configvars_rails/generators/templates',
                       __FILE__
  
  self.use_transactional_fixtures = false
  self.use_instantiated_fixtures  = false
  self.pre_loaded_fixtures = false
  fixtures :all
end
