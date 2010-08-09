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
    @default_vars = {}
    default_names.map(&:to_s).sort.each do |name|
      @default_vars[name] = ConfigvarsRails.variable_descriptor(name)
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /config_vars/new
  # GET /config_vars/new.xml
  def new
    @config_var = ConfigVar.new :name => params[:name]
    if params[:name] and descriptor = ConfigvarsRails.variable_descriptor(params[:name])
      @config_var.value = descriptor.default_value
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /config_vars/1/edit
  def edit
    @config_var = ConfigVar.find(params[:id])
  end

  # POST /config_vars
  # POST /config_vars.xml
  def create
    @config_var = ConfigVar.new(params[:config_var])

    respond_to do |format|
      if @config_var.save!
        format.html { redirect_to(config_vars_url, :notice => 'Configuration variable was successfully created.') }
      else
        format.html { render :action => :new }
      end
    end
  end

  # PUT /config_vars/1
  # PUT /config_vars/1.xml
  def update
    @config_var = ConfigVar.find(params[:id])

    respond_to do |format|
      if @config_var.update_attributes(params[:config_var])
        format.html { redirect_to(config_vars_url, :notice => 'Configuration variable was successfully updated.') }
      else
        format.html { render :action => :edit }
      end
    end
  end

  # DELETE /config_vars/1
  # DELETE /config_vars/1.xml
  def destroy
    @config_var = ConfigVar.find(params[:id])
    @config_var.destroy

    respond_to do |format|
      format.html { redirect_to(config_vars_url) }
    end
  end
end

ActionController::Base.send :include, ControllerMixin

end  # namespace ConfigvarsRails::Session

end  # namespace ConfigvarsRails
