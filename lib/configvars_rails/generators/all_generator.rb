require 'rails'

# :nodoc: namespace
module ConfigvarsRails


# Name chosen to get configvars_rails:all
class AllGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def create_config_vars
    copy_file 'config_var.rb',
              File.join('app', 'models', 'config_var.rb')
    copy_file '001_create_config_vars.rb',
        File.join('db', 'migrate', '20100808000001_create_config_vars.rb')
    copy_file 'config_vars.yml',
              File.join('test', 'fixtures', 'config_vars.yml')
    
    copy_file 'config_vars_controller.rb',
              File.join('app', 'controllers', 'config_vars_controller.rb')    
    copy_file File.join('config_vars_controller_test.rb'),
              File.join('test', 'functional', 'config_vars_controller_test.rb')
    ['edit.html.erb', 'index.html.erb'].each do |view_name|
      copy_file File.join('config_vars', view_name),
                File.join('app', 'views', 'config_vars', view_name)
    end
    copy_file File.join('layouts', 'config_vars.html.erb'),
              File.join('app', 'views', 'layouts', 'config_vars.html.erb')
    route 'config_vars'
    
    copy_file 'config_vars_initializer.rb',
              File.join('config', 'initializers', 'config_vars.rb')    
    
  end
end  # class ConfigvarsRails::ConfigVarsGenerator

end  # namespace ConfigvarsRails
