require 'action_controller'

# :nodoc: namespace
module ConfigvarsRails

# :nodoc: namespace
module Session

# Mixed into ActiveController::Base
module ControllerMixin
  def self.included(base)
    base.send :extend, ControllerClassMethods
  end
end

# Methods here become ActiveController::Base class methods.
module ControllerClassMethods  
  
  # Turns the current controller into the config vars management controller.
  #
  # Right now, this should be called from ConfigVarsController. The controller
  # name is hardwired in other parts of the implementation.
  def config_vars_controller
    include ControllerInstanceMethods
  end
end

# Included in controllers that call config_vars_controller.
module ControllerInstanceMethods
  # GET /config_vars
  # GET /config_vars.xml
  def index
    @config_vars = ConfigVar.order(:name).all
    
    defined_names = ConfigvarsRails.variable_names
    default_names = defined_names - @config_vars.map { |var| var.name.to_sym }
    @default_vars = default_names.map { |name|
      [name.to_s, ConfigvarsRails.variable_descriptor(name)]
    }.sort

    respond_to do |format|
      format.html # index.html.erb
    end
  end
    
  # GET /config_vars/http_user
  def show
    edit
    render :text => @config_var.value
  end

  # GET /config_vars/http_user/edit
  def edit
    @config_var = ConfigVar.where(:name => params[:name]).first
    unless @config_var
      @config_var = ConfigVar.new :name => params[:name]
      if descriptor = ConfigvarsRails.variable_descriptor(params[:name])
        @config_var.value = descriptor.default_value
      end
    end      
  end

  # PUT /config_vars/http_user
  def update
    @config_var = ConfigVar.where(:name => params[:name]).first
    unless @config_var
      @config_var = ConfigVar.new params[:config_var]
      @config_var.name = params[:name]
    end

    respond_to do |format|
      success = if @config_var.new_record?
        @config_var.save
      else
        @config_var.update_attributes(params[:config_var])
      end
      if success
        format.html do
          redirect_to config_vars_url,
              :notice => 'Configuration variable was successfully updated.'
        end
      else
        format.html { render :action => :edit }
      end
    end
  end

  # DELETE /config_vars/1
  # DELETE /config_vars/1.xml
  def destroy
    @config_var = ConfigVar.where(:name => params[:name]).first
    @config_var.destroy

    respond_to do |format|
      format.html { redirect_to(config_vars_url) }
    end
  end
end

ActionController::Base.send :include, ControllerMixin

end  # namespace ConfigvarsRails::Session

end  # namespace ConfigvarsRails
