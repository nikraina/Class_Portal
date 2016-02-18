class InstructorController < ApplicationController
  before_action :logged_in

  def index

  end

  def show
    @student_courses = StudentCourse.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
  end
end
