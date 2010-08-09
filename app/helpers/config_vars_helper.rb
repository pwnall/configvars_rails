module ConfigVarsHelper
  # More syntactic sugar for accessing a configuration variable.
  def config_var(name)
    ConfigVar[name]
  end
end
