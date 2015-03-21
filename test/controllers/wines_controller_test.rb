require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, wine: { api_id: @wine.api_id, api_provider: @wine.api_provider, api_url: @wine.api_url, appellation_id: @wine.appellation_id, attributes: @wine.attributes, label_url: @wine.label_url, name: @wine.name, pricemax: @wine.pricemax, pricemin: @wine.pricemin, sku: @wine.sku, varietal_id: @wine.varietal_id, vineyard_id: @wine.vineyard_id }
    end

    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, id: @wine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine
    assert_response :success
  end

  test "should update wine" do
    patch :update, id: @wine, wine: { api_id: @wine.api_id, api_provider: @wine.api_provider, api_url: @wine.api_url, appellation_id: @wine.appellation_id, attributes: @wine.attributes, label_url: @wine.label_url, name: @wine.name, pricemax: @wine.pricemax, pricemin: @wine.pricemin, sku: @wine.sku, varietal_id: @wine.varietal_id, vineyard_id: @wine.vineyard_id }
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, id: @wine
    end

    assert_redirected_to wines_path
  end
end
