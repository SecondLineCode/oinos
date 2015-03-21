require 'test_helper'

class VarietalsControllerTest < ActionController::TestCase
  setup do
    @varietal = varietals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:varietals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create varietal" do
    assert_difference('Varietal.count') do
      post :create, varietal: { api_id: @varietal.api_id, varietal: @varietal.varietal, varietal_type: @varietal.varietal_type }
    end

    assert_redirected_to varietal_path(assigns(:varietal))
  end

  test "should show varietal" do
    get :show, id: @varietal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @varietal
    assert_response :success
  end

  test "should update varietal" do
    patch :update, id: @varietal, varietal: { api_id: @varietal.api_id, varietal: @varietal.varietal, varietal_type: @varietal.varietal_type }
    assert_redirected_to varietal_path(assigns(:varietal))
  end

  test "should destroy varietal" do
    assert_difference('Varietal.count', -1) do
      delete :destroy, id: @varietal
    end

    assert_redirected_to varietals_path
  end
end
