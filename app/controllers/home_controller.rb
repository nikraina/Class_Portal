class HomeController < ApplicationController


  def login
    session[:id]=nil
    session[:email]=nil
  end


  def logintry
    if params[:email].present? && params[:password].present?
        if (user=User.where(:email => params[:email]).first)
            if (user.password == params[:password])    #(user=User.where(:password => params[:password]).first)
                session[:id]=user.id
                session[:email]=user.email
                session[:is_admin] = user.is_admin
                session[:is_instructor] = user.is_instructor
                if session[:is_admin]
                    redirect_to(:controller => 'admins', :action => 'home')
                elsif session[:is_instructor]
                    redirect_to(:controller => 'instructors', :action => 'home')
                else
                    redirect_to(:controller => 'students', :action => 'home')
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

end
