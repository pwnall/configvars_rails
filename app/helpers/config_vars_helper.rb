module ConfigVarsHelper
  # More syntactic sugar for accessing a configuration variable.
  def config_var(name)
    ConfigVar[name]
  end
  
  # Application name used in view title
  def config_vars_app_name
    Rails.application.class.name.split('::', 2).first
  end
end
