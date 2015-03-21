require 'test_helper'

class VineyardsControllerTest < ActionController::TestCase
  setup do
    @vineyard = vineyards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vineyards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vineyard" do
    assert_difference('Vineyard.count') do
      post :create, vineyard: { vineyard_name: @vineyard.vineyard_name }
    end

    assert_redirected_to vineyard_path(assigns(:vineyard))
  end

  test "should show vineyard" do
    get :show, id: @vineyard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vineyard
    assert_response :success
  end

  test "should update vineyard" do
    patch :update, id: @vineyard, vineyard: { vineyard_name: @vineyard.vineyard_name }
    assert_redirected_to vineyard_path(assigns(:vineyard))
  end

  test "should destroy vineyard" do
    assert_difference('Vineyard.count', -1) do
      delete :destroy, id: @vineyard
    end

    assert_redirected_to vineyards_path
  end
end
