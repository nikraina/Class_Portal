class PortalAdminsController < ApplicationController
  before_action :set_portal_admin, only: [:show, :edit, :update, :destroy]

  # GET /portal_admins
  # GET /portal_admins.json
  def index
    @portal_admins = PortalAdmin.all
  end

  # GET /portal_admins/1
  # GET /portal_admins/1.json
  def show
  end

  # GET /portal_admins/new
  def new
    @portal_admin = PortalAdmin.new
  end

  # GET /portal_admins/1/edit
  def edit
  end

  # POST /portal_admins
  # POST /portal_admins.json
  def create
    @portal_admin = PortalAdmin.new(portal_admin_params)

    respond_to do |format|
      if @portal_admin.save
        format.html { redirect_to @portal_admin, notice: 'Portal admin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @portal_admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @portal_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal_admins/1
  # PATCH/PUT /portal_admins/1.json
  def update
    respond_to do |format|
      if @portal_admin.update(portal_admin_params)
        format.html { redirect_to @portal_admin, notice: 'Portal admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @portal_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal_admins/1
  # DELETE /portal_admins/1.json
  def destroy
    @portal_admin.destroy
    respond_to do |format|
      format.html { redirect_to portal_admins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_admin
      @portal_admin = PortalAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_admin_params
      params[:portal_admin]
    end
end
