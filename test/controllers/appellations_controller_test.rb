require 'test_helper'

class AppellationsControllerTest < ActionController::TestCase
  setup do
    @appellation = appellations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appellations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appellation" do
    assert_difference('Appellation.count') do
      post :create, appellation: { app_area: @appellation.app_area, app_name: @appellation.app_name, app_region: @appellation.app_region }
    end

    assert_redirected_to appellation_path(assigns(:appellation))
  end

  test "should show appellation" do
    get :show, id: @appellation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appellation
    assert_response :success
  end

  test "should update appellation" do
    patch :update, id: @appellation, appellation: { app_area: @appellation.app_area, app_name: @appellation.app_name, app_region: @appellation.app_region }
    assert_redirected_to appellation_path(assigns(:appellation))
  end

  test "should destroy appellation" do
    assert_difference('Appellation.count', -1) do
      delete :destroy, id: @appellation
    end

    assert_redirected_to appellations_path
  end
end
