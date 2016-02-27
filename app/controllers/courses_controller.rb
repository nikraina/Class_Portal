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
    @inst = User.where("is_instructor = ?", true)
  end


  def edit
    @course = Course.find_by_id(params[:id])
    @inst = User.where("is_instructor = ?", true)
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
    #send_mail(@course)
  end


  def destroy
    @course= Course.find_by_id(params[:id])
    if !@course.nil?
      @inst_course = InstructorCourse.find_by_course_id(@course.course_id)
      if !@inst_course.nil?
        @inst_course.destroy
      end
      @student_course = StudentCourse.find_by_course_id(@course.course_id)
      if !@student_course.nil?
        @student_course.destroy
      end
      @course.destroy
      flash[:notice]="The course has been Deleted !!"
      redirect_to(:controller => 'courses', :action => 'index')
    end
  end

  def req_inactivation
    @course_in_req = CourseInactiveRequest.new
    @course_in_req.course_id = params[:course_id]
    if @course_in_req.save
      flash[:notice]="Your Request has been sent to Admin"
      redirect_to(:controller => 'instructors', :action => 'viewinscourses')
    else
      flash[:notice]="Request for this course has already been generated"
      redirect_to(:controller => 'instructors', :action => 'viewinscourses')
    end
  end

  def make_inactive
    @course = Course.find_by_course_id(params[:course_id])
    if @course.update_attributes(:is_active => false)
      @course_in_req = CourseInactiveRequest.find_by_course_id(params[:course_id])
      if @course_in_req.destroy
        flash[:notice]="The course has been marked Inactive"
        redirect_to(:controller => 'admins', :action => 'inactivation_req')
      else
        flash[:notice]="The course could not be marked inactive"
        redirect_to(:controller => 'admins', :action => 'inactivation_req')
      end
    else
      flash[:notice]="The course could not be marked inactive"
      redirect_to(:controller => 'admins', :action => 'inactivation_req')
    end
  end

  def send_mail(course)
    @course = course
    @notifications = Notification.find_by_course_id(@course.course_id)
    @notifications.each do |notification|
      @user = User.find_by_email(notification.email)
      StudentMailer.notify_email(@user, @course).deliver!
    end
    @notifications.destroy
  end

  def notify
    @notification = Notification.new
    @notification.course_id = params[:course_id]
    @currentuser = User.find(session[:id])
    @notification.email = @currentuser.email
    if @notification.save
      flash[:notice]="Notification request Accepted"
      redirect_to(:controller => 'students', :action => 'home')
    else
      flash[:notice]="You have already created the corresponding request"
      redirect_to(:controller => 'students', :action => 'home')
    end
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
