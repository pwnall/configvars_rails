case ENV['DB']
when /mysql/i
  `mysql -u root -e "DROP DATABASE IF EXISTS plugin_dev; CREATE DATABASE plugin_dev;"`
  ActiveRecord::Base.establish_connection adapter: 'mysql2',
      database: 'plugin_dev', username: 'root', password: ''
when /pg/i
  `psql -d postgres -c "DROP DATABASE IF EXISTS plugin_dev;"`
  `psql -d postgres -c "CREATE DATABASE plugin_dev;"`
  ActiveRecord::Base.establish_connection adapter: 'postgresql',
      database: 'plugin_dev', username: ENV['USER'], password: ''
else
  ActiveRecord::Base.establish_connection adapter: 'sqlite3',
                                          database: ':memory:'
end
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
