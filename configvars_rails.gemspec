# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{configvars_rails}
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Victor Costan}]
  s.date = %q{2011-06-30}
  s.description = %q{This gem provides a model and simple controller for
    storing global application configuration in a database. This allows the
    configuration to change without source code modifications.}
  s.email = %q{victor@costan.us}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".project",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/helpers/config_vars_helper.rb",
    "configvars_rails.gemspec",
    "lib/configvars_rails.rb",
    "lib/configvars_rails/controller.rb",
    "lib/configvars_rails/descriptor.rb",
    "lib/configvars_rails/engine.rb",
    "lib/configvars_rails/generators/all_generator.rb",
    "lib/configvars_rails/generators/templates/001_create_config_vars.rb",
    "lib/configvars_rails/generators/templates/config_var.rb",
    "lib/configvars_rails/generators/templates/config_vars.yml",
    "lib/configvars_rails/generators/templates/config_vars/edit.html.erb",
    "lib/configvars_rails/generators/templates/config_vars/index.html.erb",
    "lib/configvars_rails/generators/templates/config_vars_controller.rb",
    "lib/configvars_rails/generators/templates/config_vars_controller_test.rb",
    "lib/configvars_rails/generators/templates/config_vars_initializer.rb",
    "lib/configvars_rails/generators/templates/layouts/config_vars.html.erb",
    "lib/configvars_rails/model.rb",
    "lib/configvars_rails/routes.rb",
    "test/config_var_test.rb",
    "test/config_vars_auth_api_test.rb",
    "test/config_vars_controller_api_test.rb",
    "test/descriptor_test.rb",
    "test/helpers/application_controller.rb",
    "test/helpers/auth_test_controller.rb",
    "test/helpers/db_setup.rb",
    "test/helpers/initializers.rb",
    "test/helpers/rails.rb",
    "test/helpers/routes.rb",
    "test/helpers/view_helpers.rb",
    "test/helpers/views/auth_test/index.html.erb",
    "test/helpers/views/layouts/application.html.erb",
    "test/routes_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/pwnall/configvars_rails}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.4}
  s.summary = %q{Global configuration variables for Rails 3 applications.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1.0.rc4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.3"])
    else
      s.add_dependency(%q<rails>, [">= 3.1.0.rc4"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1.0.rc4"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
  end
end

