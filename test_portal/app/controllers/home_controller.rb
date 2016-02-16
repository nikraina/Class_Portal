class HomeController < ApplicationController
  def login
  end

  def logintry
    if params[:email].present? && params[:password].present?
      if (user=User.where(:email => params[:email]).first)
        if (user.password == params[:password])    #(user=User.where(:password => params[:password]).first)
          session[:id]=user.id
          session[:email]=user.email
          flash[:notice] = "Successfully Logged in"
          session[:is_admin] = user.is_admin
          session[:is_instructor] = user.is_instructor
          if session[:is_admin]
            redirect_to(:controller => 'admin', :action => 'index')
          elsif session[:is_instructor]
            redirect_to(:controller => 'instructor', :action => 'index')
          else
            redirect_to(:controller => 'student', :action => 'index')
          end

        else
          flash[:notice] = "Invalid email or Password"
          redirect_to(:action => 'login')
        end
      else
        flash[:notice] = "Invalid email or Password"
        redirect_to(:action => 'login')
      end
    else
      flash[:notice] = "Error: Please Enter Email & Password"
      redirect_to(:action => 'login')
    end
  end



  def logout  #SOMEHOW not getting called!!
    session[:id]=nil
    session[:email]=nil
    flash[:notice]= "Successfully Logged Out"
    redirect_to(:controller => 'home', :action => 'login')
  end

  def show
    session[:id]=nil
    session[:email]=nil
    session[:is_admin]=nil
    session[:is_instructor]=nil
    flash[:notice]= "Successfully Logged Out"
    redirect_to(:controller => 'home', :action => 'login')
  end


end
