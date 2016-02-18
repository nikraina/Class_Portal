class InstructorCoursesController < ApplicationController
  before_action :logged_in

  # GET /instructor_courses
  # GET /instructor_courses.json
  def index
    @instructor_courses = InstructorCourse.all
  end

  # GET /instructor_courses/1
  # GET /instructor_courses/1.json
  def show
  end

  # GET /instructor_courses/new
  def new
    @instructor_course = InstructorCourse.new
  end

  # GET /instructor_courses/1/edit
  def edit
  end

  # POST /instructor_courses
  # POST /instructor_courses.json
  def create
    @instructor_course = InstructorCourse.new(instructor_course_params)

    respond_to do |format|
      if @instructor_course.save
        format.html { redirect_to @instructor_course, notice: 'Instructor course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instructor_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @instructor_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructor_courses/1
  # PATCH/PUT /instructor_courses/1.json
  def update
    respond_to do |format|
      if @instructor_course.update(instructor_course_params)
        format.html { redirect_to @instructor_course, notice: 'Instructor course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instructor_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructor_courses/1
  # DELETE /instructor_courses/1.json
  def destroy
    @instructor_course.destroy
    respond_to do |format|
      format.html { redirect_to instructor_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor_course
      @instructor_course = InstructorCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_course_params
      params.require(:instructor_course).permit(:email, :course_id)
    end
end
