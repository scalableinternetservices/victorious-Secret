require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
    assert_not_nil assigns(:providers)
  end

  test "should get new" do
    sign_in users(:user1)
    get :new
    assert_response :success
  end

  test "should create provider" do
    sign_in users(:user1)
    assert_difference('Provider.count') do
      post :create, provider: { rating: @provider.rating, user_id: @provider.user_id }
    end

    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should show provider" do
    sign_in users(:user1)
    get :show, id: @provider
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get :edit, id: @provider
    assert_response :success
  end

  test "should update provider" do
    sign_in users(:user1)
    patch :update, id: @provider, provider: { rating: @provider.rating, user_id: @provider.user_id }
    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should destroy provider" do
    sign_in users(:user1)
    assert_difference('Provider.count', -1) do
      delete :destroy, id: @provider
    end

    assert_redirected_to providers_path
  end
end
