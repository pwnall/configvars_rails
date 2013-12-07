require 'action_pack'

# :nodoc: namespace
module ConfigvarsRails

# :nodoc: namespace
module Routes

# :nodoc: mixed into ActionPack's route mapper.
module MapperMixin
  def config_vars
    get 'config_vars' => 'config_vars#index', as: :config_vars
    get 'config_vars/:name/edit' => 'config_vars#edit', as: :edit_config_var,
        constraints: { name: /[^\/]+/ }
    get 'config_vars/:name' => 'config_vars#show', as: :config_var,
        constraints: { name: /[^\/]+/ }
    put 'config_vars' => 'config_vars#update'
    delete 'config_vars/:name' => 'config_vars#destroy',
        constraints: { name: /[^\/]+/ }
  end
end

ActionDispatch::Routing::Mapper.send :include, MapperMixin

end  # namespace ConfigvarsRails::Routes

end  # namespace ConfigvarsRails
