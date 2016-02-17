class CoursesController < ApplicationController
  before_action :logged_in

  def index
    @courses = Course.all
  end


  def show
    @courses = Course.all
  end
 # def showall
  # @courses = Course.all
  #end

  def new
    @course = Course.new
  end


  def edit
  end


  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]="Course was successfully created."
      redirect_to(:controller => 'admin', :action => 'show')
    else
      flash[:notice]="Course couldnot be created !!"
      redirect_to(:controller => 'courses', :action => 'new')
    end
  end


  def update
    @course= Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice]="User was successfully edited!!!"
      redirect_to(:controller => 'courses', :action => 'show')
    else
      flash[:notice]="User couldnot be edited !!"
      redirect_to(:controller => 'courses', :action => 'show')
    end
  end


  def destroy
    @course= Course.find(params[:id])
    @course.destroy
    flash[:notice]="The course has been Deleted !!"
    redirect_to(:controller => 'admin', :action => 'show')
    #respond_to do |format|
    #  format.html { redirect_to courses_url }
    #  format.json { head :no_content }
    #end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end


    def course_params
      params.fetch(:course, {})
      params.require(:course).permit(:course_id, :title, :description, :start_date, :end_date, :is_active, :materials)
    end
end
