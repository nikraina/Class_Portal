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
    @currentuser = User.find_by_id(session[:id])
    if @user.save
      flash[:notice]="User was successfully created."
      if !@currentuser.nil?
        if @currentuser.is_admin
          redirect_to(:controller => 'users', :action => 'index')
        end
      else
          redirect_to(:controller => 'home', :action => 'login')
      end
    else
      flash[:notice]="User couldnot be created !!"
      if !@currentuser.nil?
        if @currentuser.is_admin
          redirect_to(:controller => 'users', :action => 'new')
        end
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
    if @user.is_admin
      @user.destroy
      redirect_to(:controller => 'users', :action => 'index')
    elsif @user.is_instructor
        @course = Course.find_by_email(@user.email)
        @instructorcourse = InstructorCourse.find_by_email(@user.email)
        if !@course.nil?
          flash[:notice]="Error: This Instructor is a primary instructor for a course, first edit course details!!"
          redirect_to(:controller => 'users', :action => 'index')
        elsif !@instructorcourse.nil?
          @instructorcourse.destroy
          @user.destroy
          redirect_to(:controller => 'users', :action => 'index')
        end
    elsif !@user.is_instructor and !@user.is_admin
        @studentcourse = StudentCourse.find_by_email(@user.email)
        if !@studentcourse.nil
          @studentcourse.destroy
        end
        @user.destroy
        redirect_to(:controller => 'users', :action => 'index')
    end
  end



  private

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
    end
end
