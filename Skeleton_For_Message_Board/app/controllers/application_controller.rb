class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def logged_in
    if session[:id]
      return true
    else
      flash[:notice]= "Login Please"
      redirect_to(:controller => 'home', :action => 'index')
      return false
    end
  end
end
