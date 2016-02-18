class StudentCoursesController < ApplicationController
  before_action :logged_in

  # GET /student_courses
  # GET /student_courses.json
  def index
    @student_courses = StudentCourse.all
    #@viewspecific = params[:viewspecific]
  end

  # GET /student_courses/1
  # GET /student_courses/1.json
  def show

  end

  # GET /student_courses/new
  def new
    @student_course = StudentCourse.new
  end

  # GET /student_courses/1/edit
  def edit
  end

  # POST /student_courses
  # POST /student_courses.json
  def create
    @student_course = StudentCourse.new(student_course_params)
    #@course = Course.where("course_id", params[:course_id])
    #@course = Course.find_by(course_id: params[:course_id])
    #@user = User.where("email", params[:email])
    #if Course.find_by(course_id: params[:course_id])

    #end
    #if params[:course_id] == @course.course_id and @student_course.email == @course.email
      if @student_course.save
        flash[:notice]="Change this."
        redirect_to(:controller => 'admin', :action => 'show')
      else
        flash[:notice]="User couldnot be created !!"
        redirect_to(:controller => 'student_courses', :action => 'new')
      end
    #end
    #respond_to do |format|
    #  if @student_course.save
    #    format.html { redirect_to @student_course, notice: 'Student course was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @student_course }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @student_course.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /student_courses/1
  # PATCH/PUT /student_courses/1.json
  def update
    respond_to do |format|
      if @student_course.update(student_course_params)
        format.html { redirect_to @student_course, notice: 'Student course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_courses/1
  # DELETE /student_courses/1.json
  def destroy
    @student_course.destroy
    respond_to do |format|
      format.html { redirect_to student_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_course
      @student_course = StudentCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_course_params
      params.require(:student_course).permit(:email, :course_id, :is_curr_enrolled, :has_requested, :is_denied, :grade)
    end
end
