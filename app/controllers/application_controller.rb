class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def logged_in
    if session[:id]
      return true
    else
      flash[:notice]= "Login Please"
      redirect_to(:controller => 'home', :action => 'login')
      return false
    end
  end

  def logged_in_admin
    @user = User.find_by_id(session[:id])
    if @user.is_admin
      return true
    elsif @user.is_instructor
      redirect_to(:controller => 'instructors', :action => 'home')
    else
      redirect_to(:controller => 'students', :action => 'home')
    end
  end

  def logged_in_student
    @user = User.find_by_id(session[:id])
    if !@user.is_admin and !@user.is_instructor
      return true
    elsif @user.is_instructor
      redirect_to(:controller => 'instructors', :action => 'home')
    else
      redirect_to(:controller => 'admins', :action => 'home')
    end
  end

  def logged_in_instructor
    @user = User.find_by_id(session[:id])
    if @user.is_instructor
      return true
    elsif @user.is_admin
      redirect_to(:controller => 'admins', :action => 'home')
    else
      redirect_to(:controller => 'students', :action => 'home')
    end
  end

end
