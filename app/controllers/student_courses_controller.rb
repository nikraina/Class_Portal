class StudentCoursesController < ApplicationController
  before_action


  def index
    @student_courses = StudentCourse.all
  end

  def studenthistory

  end

  def show
  end

  def studentcourses

  end

  def new
    @student_course = StudentCourse.new
  end


  def edit
    @student_course = StudentCourse.find_by_id(params[:id])
  end


  def create
    @student_course = StudentCourse.new(student_course_params)
    if params[:student]
      @student_course.has_requested = true
      @student_course.email = params[:email]
    end
    if @student_course.save
      if params[:student]
        flash[:notice]="Enrollment Requested"
        redirect_to(:controller => 'students', :action => 'home')
      else
        flash[:notice]="Student Enrolled"
        redirect_to(:controller => 'admins', :action => 'home')
      end
    else
      if params[:student]
        flash[:notice]="Enrollment Request Not created"
        redirect_to(:controller => 'student_courses', :action => 'new', :student => true)
      else
        flash[:notice]="Student Could not be Enrolled"
        redirect_to(:controller => 'student_courses', :action => 'new')
      end

    end
  end


  def update
    @student_course = StudentCourse.find_by_id(params[:id])
    @currentuser= User.find_by_id(session[:id])
    if params[:drop]
      if @student_course.update_attributes(:is_curr_enrolled => false , :has_requested => false, :is_denied => true )
        flash[:notice]="Course Dropped"
          redirect_to(:controller => 'students', :action => 'viewcourses')
      else
        flash[:notice]="Error could not drop Course"
        redirect_to(:controller => 'students', :action => 'viewcourses')
      end
    elsif @student_course.update(student_course_params)
      if @currentuser.is_instructor
        if (@student_course.is_curr_enrolled and @student_course.has_requested) or (@student_course.is_denied and @student_course.has_requested)
          @student_course.update_attributes(:has_requested => false)
        end
      end
      flash[:notice]="Updated successfully"
      if @currentuser.is_admin
        redirect_to(:controller => 'student_courses', :action => 'index')
      else
        redirect_to(:controller => 'instructors', :action => 'studentsrequest')
      end
    else
      flash[:notice]="Error could not Update"
      redirect_to(:controller => 'instructor_courses', :action => 'edit')
    end
  end



  private
    def set_student_course
      @student_course = StudentCourse.find_by_id(params[:id])
    end


    def student_course_params
      params.require(:student_course).permit(:email, :course_id, :is_curr_enrolled, :has_requested, :is_denied, :grade)
    end
end
