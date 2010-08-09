require 'rails'


# :nodoc: putting the generator in Rails' namespace, since we only have one
module Rails


class ConfigVarsGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def create_config_vars
    copy_file 'config_var.rb',
              File.join('app', 'models', 'config_var.rb')
    copy_file '002_create_facebook_tokens.rb',
        File.join('db', 'migrate', '20100808000001_create_config_vars.rb')
    copy_file 'config_vars.yml',
              File.join('test', 'fixtures', 'config_vars.yml')
    
    copy_file 'config_vars_controller.rb',
              File.join('app', 'controllers', 'config_vars_controller.rb')    
    copy_file File.join('config_vars_controller_test.rb'),
              File.join('test', 'functional', 'config_vars_controller_test.rb')
    [
      '_form.html.erb', 'edit.html.erb', 'index.html.erb', 'new.html.erb',
      'show.html.erb'
    ].each do |view_name|
      copy_file File.join('config_vars', view_name),
                File.join('app', 'views', 'config_vars', view_name)
    end
    route 'resources :config_vars'
  end
end  # class Rails::ConfigVarsGenerator

end  # namespace Rails
