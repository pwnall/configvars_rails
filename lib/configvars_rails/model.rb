require 'active_record'

# :nodoc: namespace
module ConfigvarsRails

# :nodoc: namespace
module Model


# Mixed into ActiveRecord::Base
module ModelMixin
  def self.included(base)
    base.send :extend, ModelClassMethods
  end
end


# Methods here become ActiveRecord::Base class methods.
module ModelClassMethods
  # Extends the model to make it hold configuration variables.
  def config_vars_model
    # The name of the configuration variable.
    validates :name, :uniqueness => true, :length => 1..64, :presence => true
  
    # The value of the configuration variable.
    validates :value, :length => 1..1024, :presence => true

    extend ModelMetaclassMethods    
    include ModelInstanceMethods
  end
end  # module ConfigvarsRails::Model::ModelClassMethods


# Included in the metaclass of models that call pwnauth_user_model.
module ModelMetaclassMethods
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
end  # module ConfigvarsRails::Model::ModelMetaclassMethods


# Included in models that call config_vars_model.
module ModelInstanceMethods
  # The descriptor for this variable, or nil if no descriptor was defined.
  def descriptor
    ConfigvarsRails.variable_descriptor name
  end
  
  # Use name instead of ID on all URLs.
  def to_param
    name
  end
end  # module ConfigvarsRails::Model::ModelInstanceMethods

ActiveRecord::Base.send :include, ModelMixin

end  # namespace ConfigvarsRails::Model

end  # namespace ConfigvarsRails
