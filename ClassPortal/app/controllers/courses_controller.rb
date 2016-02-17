class CoursesController < ApplicationController
  before_action :logged_in


  def index
    @courses = Course.all
  end


  def show
    @courses = Course.all
  end
  def showall
   @courses = Course.all
  end

  def new
    @course = Course.new
  end


  def edit
  end


  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]="Course was successfully created."
      redirect_to(:controller => 'courses', :action => 'show')
    else
      flash[:notice]="Course couldnot be created !!"
      redirect_to(:controller => 'courses', :action => 'new')
    end
  end


  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
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
