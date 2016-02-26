class StudentsController < UsersController
  before_action :logged_in

  def home

  end

  def viewcourses

  end

  def searchquery
    #@courses = Courses.all
  end

  def showsearchresults
      @temp_courses = Course.all
      @courses ||=[]
      if('true' == params[:is_active])
        set_true = true
      else
        set_true = false
      end
      @temp_courses.each do |course|
        if(course.course_id == params[:course_id] or course.title == params[:title] or course.email == params[:email] or course.description == params[:description] or course.is_active == set_true)
          @courses << course
        end

      end
      @courses
  end

  def showmyrequests
    @user = User.find(session[:id])
    @student_courses = StudentCourse.where("email = ? AND (has_requested = ? OR is_denied = ?)", @user.email, true, true)
  end

  def enrollmentrequest
    @user = User.find(session[:id])
    @student_course = StudentCourse.new
    @student_course.email = @user.email
    @student_course.course_id = params[:course_id]
    @student_course.has_requested = true
    if @student_course.save
      flash[:notice]="Enrollment Requested"
      redirect_to(:controller => 'students', :action => 'home')
    else
      flash[:notice]="Enrollment has already been Requested"
      redirect_to(:controller => 'students', :action => 'home')
    end
    #end
  end


  private
  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :is_admin, :is_instructor)
  end
end
