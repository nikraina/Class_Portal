require 'test_helper'

class PortalAdminsControllerTest < ActionController::TestCase
  setup do
    @portal_admin = portal_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portal_admin" do
    assert_difference('PortalAdmin.count') do
      post :create, portal_admin: {  }
    end

    assert_redirected_to portal_admin_path(assigns(:portal_admin))
  end

  test "should show portal_admin" do
    get :show, id: @portal_admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portal_admin
    assert_response :success
  end

  test "should update portal_admin" do
    patch :update, id: @portal_admin, portal_admin: {  }
    assert_redirected_to portal_admin_path(assigns(:portal_admin))
  end

  test "should destroy portal_admin" do
    assert_difference('PortalAdmin.count', -1) do
      delete :destroy, id: @portal_admin
    end

    assert_redirected_to portal_admins_path
  end
end
