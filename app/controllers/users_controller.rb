class UsersController < ApplicationController
  before_action :logged_in, only: [:index, :show, :edit, :update, :destroy]


  def index
    @users = User.all
  end


  def show
    @user = User.find_by_id(params[:id])
  end


  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
    render action: 'edit'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="User was successfully created."
      if @user.is_admin
        redirect_to(:controller => 'users', :action => 'index')
      else
        redirect_to(:controller => 'home', :action => 'login')
      end
    else
      flash[:notice]="User couldnot be created !!"
      if @user.is_admin
        redirect_to(:controller => 'users', :action => 'new')
      else
        redirect_to(:controller => 'home', :action => 'login')
      end
    end
  end

  def update
    @user= User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:notice]="User was successfully edited!!!"
      redirect_to(:controller => 'users', :action => 'show')
    else
      flash[:notice]="User couldnot be edited !!"
      redirect_to(:controller => 'users', :action => 'edit')
    end
  end



  def destroy
    @currentuser= User.find_by_id(session[:id])
    @user = User.find_by_id(params[:id])
    if @currentuser==@user
      flash[:notice]="Error: Cannot Delete Yourself!!"
    elsif @user.email == 'master@master.com'
      flash[:notice]="Error: Cannot Delete Master Yoda!!"
    else
      @user.destroy
    end
    redirect_to(:controller => 'users', :action => 'index')
  end

  private

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
    end
end
