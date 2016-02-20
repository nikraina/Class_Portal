class CoursesController < ApplicationController
  before_action :logged_in


  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_id(params[:id])
  end


  def new
    @course = Course.new
  end


  def edit
    @course = Course.find_by_id(params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]="Course was successfully created."
      @instructor_course = InstructorCourse.create( course_id: course_params[:course_id], email: course_params[:email])
      @instructor_course.save
      redirect_to(:controller => 'courses', :action => 'index')
    else
      flash[:notice]="Course couldnot be created !!"
      redirect_to(:controller => 'courses', :action => 'new')
    end
  end


  def update
    @course= Course.find_by_id(params[:id])
    if @course.update(course_params)
      flash[:notice]="Course was successfully edited!!!"
      redirect_to(:controller => 'courses', :action => 'show')
    else
      flash[:notice]="Course could not be edited!!"
      redirect_to(:controller => 'courses', :action => 'show')
    end
  end


  def destroy
    @course= Course.find_by_id(params[:id])
    @course.destroy
    flash[:notice]="The course has been Deleted !!"
    redirect_to(:controller => 'courses', :action => 'index')
  end

  private

    def set_course
      @course = Course.find_by_id(params[:id])
    end


    def course_params
      params.fetch(:course, {})
      params.require(:course).permit(:course_id, :title, :email, :description, :start_date, :end_date, :is_active, :materials)
    end
end
