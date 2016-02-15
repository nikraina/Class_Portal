class LoginController < ApplicationController

  def login
  end

  def logintry
      if params[:email].present? && params[:password].present?
          if (user_admin=PortalAdmin.where(:email => params[:email]).first)
              if user_admin.authenticate(params[:password])
                  session[:id]=user_admin.id
                  session[:email]=user_admin.email
                  flash[:notice] = "Successfully Logged in"
                      redirect_to(:controller => 'portal_admins', :action => 'index')
              end
          elsif (user_instructor=Instructor.where(:email => params[:email]).first)
              if user_instructor.authenticate(params[:password])
                  session[:id]=user_instructor.id
                  session[:email]=user_instructor.email
                  flash[:notice] = "Successfully Logged in"
                      redirect_to(:controller => 'instructors', :action => 'index')
              end
          elsif (user_student=Student.where(:email => params[:email]).first)
              if user_student.authenticate(params[:password])
                  session[:id]=user_student.id
                  session[:email]=user_student.email
                  flash[:notice] = "Successfully Logged in"
                      redirect_to(:controller => 'students', :action => 'index')
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

  def logout
    session[:id]=nil
    session[:email]=nil
    flash[:notice]= "Successfully Logged Out"
        redirect_to(:controller => 'home', :action => 'index')
  end
end
