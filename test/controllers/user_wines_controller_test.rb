require 'test_helper'

class UserWinesControllerTest < ActionController::TestCase
  setup do
    @user_wine = user_wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_wine" do
    assert_difference('UserWine.count') do
      post :create, user_wine: { rating: @user_wine.rating, review: @user_wine.review, stage_id: @user_wine.stage_id, user_id: @user_wine.user_id, wine_id: @user_wine.wine_id }
    end

    assert_redirected_to user_wine_path(assigns(:user_wine))
  end

  test "should show user_wine" do
    get :show, id: @user_wine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_wine
    assert_response :success
  end

  test "should update user_wine" do
    patch :update, id: @user_wine, user_wine: { rating: @user_wine.rating, review: @user_wine.review, stage_id: @user_wine.stage_id, user_id: @user_wine.user_id, wine_id: @user_wine.wine_id }
    assert_redirected_to user_wine_path(assigns(:user_wine))
  end

  test "should destroy user_wine" do
    assert_difference('UserWine.count', -1) do
      delete :destroy, id: @user_wine
    end

    assert_redirected_to user_wines_path
  end
end
