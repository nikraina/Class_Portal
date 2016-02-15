class ApplicationController < ActionController::Base
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
