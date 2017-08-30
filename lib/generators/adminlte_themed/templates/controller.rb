class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_name %>, only: [:show, :edit, :update, :destroy]
<% if with_breadcrump? -%>
  before_action :set_breadcrumb, only: [:index, :new, :edit]
<% end -%>  
<% if with_devise? -%>
  before_action :authenticate_user!
  load_and_authorize_resource
<% end -%>  
  def index
    @<%= plural_name %> = <% if with_kaminari? -%> <%= class_name.underscore.humanize %>.page params[:page] <% else -%> <%= class_name.underscore.humanize %>.all <% end -%> 
  end
 
  def show
  end
  
  def new
    @<%= singular_name %> = <%= class_name.underscore.humanize %>.new
  end

  def edit
  end

  def create
    @<%= singular_name %> = <%= class_name.underscore.humanize %>.new(<%= singular_name %>_params)
    if @<%= singular_name %>.save
      if params[:save_and_continue]
        redirect_to edit_<%= singular_name %>_path(@<%= singular_name %>), notice: t("helpers.links.create_success", model: <%= class_name.underscore.humanize %>.model_name.human)
      elsif params[:save_and_finalize]
        redirect_to @<%= singular_name %>, notice: t("helpers.links.create_success", model: <%= class_name.underscore.humanize %>.model_name.human)
      end
    else
      flash[:errors] = @<%= singular_name %>.errors.full_messages
      render :new
    end
  end


  def update
    if @<%= singular_name %>.update(<%= singular_name %>_params)
      if params[:save_and_continue]
        redirect_to edit_<%= singular_name %>_path(@<%= singular_name %>), notice: t("helpers.links.update_success", model: <%= class_name.underscore.humanize %>.model_name.human)
      elsif params[:save_and_finalize]
        redirect_to @<%= singular_name %>, notice: t("helpers.links.update_success", model: <%= class_name.underscore.humanize %>.model_name.human)
      end
    else
      flash[:errors] = @<%= singular_name %>.errors.full_messages
      render :edit
    end
  end

  def destroy
    @<%= singular_name %>.destroy
    redirect_to <%= plural_name %>_url, notice: t("helpers.links.destroy_success", model: <%= class_name.underscore.humanize %>.model_name.human)
  end

  private

  def set_<%= singular_name %>
    @<%= singular_name %> = <%= class_name.underscore.humanize %>.find(params[:id])
  end

  def <%= singular_name %>_params
    params.require(:<%= singular_name %>).permit(<%= editable_attributes.map { |a| a.name.dup.prepend(':') }.join(', ') %>)
  end

end