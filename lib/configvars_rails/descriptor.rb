# :nodoc: namespace
module ConfigvarsRails
  @vars = {}
  
  # Configuration variable descriptor.
  class Descriptor
    # Creates a new variable descriptor.
    #
    # Args:
    #   type:: the type of values the variable can take
    #   default_value:: a Proc or default value for the configuration variable
    def initialize(value_type, default_value)
      @value_type = value_type.to_sym
      @default = default_value.dup
    end

    # The default value to be used if the variable doesn't have an explicit
    # value.
    def default_value
      if @default.kind_of? Proc
        @default.call
      else
        @default.dup
      end
    end
    
    # The type of values that the variable takes.
    attr_reader :value_type
  end
  
  # Registers a new configuration variable.
  def self.add_variable(name, descriptor)
    @vars[name.to_sym] = descriptor
  end
  
  # The descriptor for a configuration variable.
  def self.variable_descriptor(name)
    @vars[name.to_sym]
  end
  
  # The names for all the configuration variables.
  def self.variable_names
    @vars.keys
  end
end  # namespace ConfigvarsRails


# Methods for defining configuration variables with default values.
module ConfigVars
  # Declares a configuration variable with string values.
  #
  # Args:
  #   name:: the variable's name
  #   default_value:: a string 
  #
  # Optionally, takes a block that will be called when the variable's default
  # value is requested.
  def self.string(name, default_value = nil, &block)
    descriptor = ConfigvarsRails::Descriptor.new :string, default_value || block
    ConfigvarsRails.add_variable name, descriptor
  end
end  # namespace ConfigVars
