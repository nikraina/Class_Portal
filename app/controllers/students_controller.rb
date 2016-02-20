class StudentsController < UsersController
  before_action :logged_in

  def home

  end

  def viewcourses

  end

  private
  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
  end
end
