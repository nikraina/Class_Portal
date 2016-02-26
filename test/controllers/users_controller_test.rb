require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.create(name: "Example User", email: "user@example.com",
                     password: "password")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, is_admin: @user.is_admin, name: @user.name, password: @user.password }
    end

    assert_response :redirect
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :redirect
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, is_admin: @user.is_admin, name: @user.name, password: @user.password }
    assert_response :redirect
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_response :redirect
  end
end
