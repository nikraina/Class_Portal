class AdminsController < UsersController
  before_action :logged_in

  def home
   @user = User.find_by_id(session[:id])
  end

  def showinstructors
    @users = User.all
  end

  def showstudents
    @users = User.all
  end

  def showadmins
    @users = User.where("is_admin = ?", true)
  end

  def studentrequests

  end

  def inactivation_req
    @course_in_reqs = CourseInactiveRequest.all
  end


  private
  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
  end

end
