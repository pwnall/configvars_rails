require 'active_support'

# :nodoc: namespace
module ConfigvarsRails

# Included by the config vars management controller.
#
# Some parts of the codebase expect the controller to be named
# ConfigVarsController.
module Controller
  extend ActiveSupport::Concern

  included do
    layout 'config_vars'
  end

  # GET /config_vars
  def index
    @config_vars = ConfigVar.order(:name).to_a

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
    render text: @config_var.value
  end

  # GET /config_vars/http_user/edit
  def edit
    @config_var = ConfigVar.where(name: params[:name]).first
    unless @config_var
      @config_var = ConfigVar.new name: params[:name]
      if descriptor = ConfigvarsRails.variable_descriptor(params[:name])
        @config_var.value = descriptor.default_value
      end
    end
  end

  # PUT /config_vars/http_user
  def update
    @config_var = ConfigVar.where(name: params[:config_var][:name]).first
    unless @config_var
      @config_var = ConfigVar.new update_params[:config_var]
    end

    respond_to do |format|
      success = if @config_var.new_record?
        @config_var.save
      else
        @config_var.update_attributes update_params[:config_var]
      end
      if success
        format.html do
          redirect_to config_vars_url,
              notice: 'Configuration variable was successfully updated.'
        end
      else
        format.html { render action: :edit }
      end
    end
  end

  # DELETE /config_vars/http_user
  def destroy
    @config_var = ConfigVar.where(name: params[:name]).first
    @config_var.destroy

    respond_to do |format|
      format.html { redirect_to(config_vars_url) }
    end
  end

  if defined? ActiveModel::ForbiddenAttributesProtection
    # Rails 4.

    # Parameters used to change a config variable.
    def update_params
      params.permit config_var: [:name, :value]
    end
  else
    # Rails 3.
    def update_params
      params
    end
  end

end  # module ConfigvarsRails::Controller

end  # namespace ConfigvarsRails
