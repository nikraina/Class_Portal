class InstructorCoursesController < ApplicationController
  before_action :logged_in

  def index
    @instructor_courses = InstructorCourse.all
  end


  def show
  end

  def insthistory

  end

  def new
    @instructor_course = InstructorCourse.new
  end

  def edit
    @instructor_course = InstructorCourse.find_by_id(params[:id])
  end


  def create
    @instructor_course = InstructorCourse.new(instructor_course_params)

      if @instructor_course.save
        flash[:notice]="Instructor Assigned successfully"
        redirect_to(:controller => 'instructor_courses', :action => 'index')
      else
        flash[:notice]="Instructor could not be Assigned"
        redirect_to(:controller => 'instructor_courses', :action => 'new')
      end
  end

  def update
    @instructor_course = InstructorCourse.find_by_id(params[:id])
      if @instructor_course.update(instructor_course_params)
        flash[:notice]="Updated successfully"
        redirect_to(:controller => 'instructor_courses', :action => 'index')
      else
        flash[:notice]="Error could not Update"
        redirect_to(:controller => 'instructor_courses', :action => 'edit')
      end
  end


  def destroy
    @instructor_course = InstructorCourse.find(params[:id])
    if(Course.exists?(:email => @instructor_course.email))
      flash[:notice]="Error could not Delete; This Instructor is the primary instructor of this Course:First edit Course details"
      redirect_to(:controller => 'instructor_courses', :action => 'index')
    else
        @instructor_course.destroy
        redirect_to(:controller => 'instructor_courses', :action => 'index')
    end
  end

  private

    def set_instructor_course
      @instructor_course = InstructorCourse.find_by_id(params[:id])
    end

    def instructor_course_params
      params.require(:instructor_course).permit(:email, :course_id)
    end
end
