require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "configvars_rails"
  gem.homepage = "http://github.com/pwnall/configvars_rails"
  gem.license = "MIT"
  gem.summary = %Q{Global configuration variables for Rails 3 applications.}
  gem.description = %Q{This gem provides a model and simple controller for
    storing global application configuration in a database. This allows the
    configuration to change without source code modifications.}
  gem.email = "victor@costan.us"
  gem.authors = ["Victor Costan"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency "rails", ">= 3.0.0"
  gem.add_development_dependency "sqlite3-ruby", ">= 1.3.0"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "configvars_rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
