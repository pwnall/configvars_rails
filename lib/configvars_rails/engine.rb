require 'configvars_rails'
require 'rails'

# :nodoc: namespace
module ConfigvarsRails

class Engine < Rails::Engine
  generators do
    require 'configvars_rails/generators/all_generator.rb'
  end
end  # class ConfigvarsRails::Engine

end  # namespace ConfigvarsRails
