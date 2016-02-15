class PortalAdminsController < ApplicationController
 before_action :logged_in

  def index
    @portal_admin = PortalAdmin.find_by_id(session[:id])
  end


  def show
    @portal_admin = PortalAdmin.all
  end


  def new
  end


  def create
    @portal_admin = PortalAdmin.new(portal_admin_params)
    if @portal_admin.save
        flash[:notice] = "New Admin Created Successfully"
        redirect_to(:action =>'index', :id => @portal_admin.id.to_s )
      else
        flash[:notice] = "Error: Could not create Admin, Please try Again"
        redirect_to(:action =>'new')
      end
    end


  def edit
    @portal_admin = PortalAdmin.find_by_id(session[:id])
  end


  def update
      if @portal_admin.update(portal_admin_params)
        flash[:notice] = "Admin was successfully updated."
        redirect_to(:action =>'index', :id => @portal_admin.id.to_s)
      else
        flash[:notice] = "Error: Could not Update, Please try Again"
        redirect_to(:action =>'edit')
      end
    end


  def delete
    @portal_admin = PortalAdmin.find_by_id(session[:id])
    @admin = PortalAdmin.find_by_id(params[:id])
    if @admin==@portal_admin
      flash[:notice]="Error: Cannot Delete Yourself!!"
      redirect_to(:action => 'index', :id => @portal_admin.id.to_s)
    else
      redirect_to(:action =>'destroy',:id => @admin.id.to_s)
    end
  end


  def destroy
    @admin=PortalAdmin.find_by_id(params[:id])
    @admin.destroy
    flash[:notice] = "Deleted Successfully"
    redirect_to(:action => 'index')
  end


  private

    def set_portal_admin
      @portal_admin = PortalAdmin.find(params[:id])
    end

    def portal_admin_params
      params[:portal_admin]
    end
end
