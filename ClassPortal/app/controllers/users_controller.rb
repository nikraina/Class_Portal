class UsersController < ApplicationController
  before_action :logged_in


  def index
    @users = User.all
  end


  def show
    @users = User.all
  end


  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="User was successfully created."
      redirect_to(:controller => 'admin', :action => 'show')
    else
      flash[:notice]="User couldnot be created !!"
      redirect_to(:controller => 'users', :action => 'new')
    end
  end

  def update
    @user= User.find(params[:id])
      if @user.update(user_params)
        flash[:notice]="User was successfully edited!!!"
        redirect_to(:controller => 'users', :action => 'show')
      else
        flash[:notice]="User couldnot be edited !!"
        redirect_to(:controller => 'users', :action => 'edit')
      end
  end


  def destroy
    @currentuser= User.find(session[:id])
    @user = User.find(params[:id])
    if @currentuser==@user
      flash[:notice]="Error: Cannot Delete Yourself!!"
      #redirect_to(:controller => 'admin', :action => 'show', :viewusers =>true)
    elsif @user.email == 'master@master.com'
      flash[:notice]="Error: Cannot Delete Master Yoda!!"
      #redirect_to(:controller => 'admin', :action => 'show' , :viewusers =>true)
    else
      @user.destroy
      #redirect_to(:controller => 'admin', :action => 'show', :viewusers =>true)
    end
    redirect_to(:controller => 'admin', :action => 'show', :viewusers =>true)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
    end
end
