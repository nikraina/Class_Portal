class InstructorsController < UsersController
  before_action :logged_in, :logged_in_instructor

  def home

  end

  def viewinscourses

  end

  def insstudents
    
  end

  def studentsrequest

  end


  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
  end

end
