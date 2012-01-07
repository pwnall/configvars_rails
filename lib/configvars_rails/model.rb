require 'active_support'

# :nodoc: namespace
module ConfigvarsRails

# :nodoc: namespace
module Model
  extend ActiveSupport::Concern

  included do
    # The name of the configuration variable.
    validates :name, :uniqueness => true, :length => 1..64, :presence => true
  
    # The value of the configuration variable.
    validates :value, :length => 0..1024, :exclusion => { :in => [nil] }
  end


  # Class methods for models that include ConfigVarsRails::Model.
  module ClassMethods
    # Access configuration flags by ConfigVar['flag_name'].
    def [](name)
      var = where(:name => name).first
      return var.value if var
      
      descriptor = ConfigvarsRails.variable_descriptor name
      return descriptor.default_value if descriptor
      
      raise IndexError, "Configuration variable #{name} not found"
    end
    
    # Set configuration flags by ConfigVar['flag_name'] = 'flag_value'.
    def []=(name, value)
      flag = where(:name => name).first
      flag ||= new :name => name
      flag.value = value
      flag.save!
      value
    end
  end  # module ConfigvarsRails::Model::ClassMethods


  # The descriptor for this variable, or nil if no descriptor was defined.
  def descriptor
    ConfigvarsRails.variable_descriptor name
  end
  
  # Use name instead of ID on all URLs.
  def to_param
    name
  end

end  # namespace ConfigvarsRails::Model

end  # namespace ConfigvarsRails
