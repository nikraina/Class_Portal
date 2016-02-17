require 'test_helper'

class InstructorCoursesControllerTest < ActionController::TestCase
  setup do
    @instructor_course = instructor_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instructor_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instructor_course" do
    assert_difference('InstructorCourse.count') do
      post :create, instructor_course: {  }
    end

    assert_redirected_to instructor_course_path(assigns(:instructor_course))
  end

  test "should show instructor_course" do
    get :show, id: @instructor_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instructor_course
    assert_response :success
  end

  test "should update instructor_course" do
    patch :update, id: @instructor_course, instructor_course: {  }
    assert_redirected_to instructor_course_path(assigns(:instructor_course))
  end

  test "should destroy instructor_course" do
    assert_difference('InstructorCourse.count', -1) do
      delete :destroy, id: @instructor_course
    end

    assert_redirected_to instructor_courses_path
  end
end
