require 'test_helper'

class ConreviewsControllerTest < ActionController::TestCase
  setup do
    @conreview = conreviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conreviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conreview" do
    assert_difference('Conreview.count') do
      post :create, conreview: { description: @conreview.description, post_id: @conreview.post_id, provider_id: @conreview.provider_id, rating: @conreview.rating }
    end

    assert_redirected_to conreview_path(assigns(:conreview))
  end

  test "should show conreview" do
    get :show, id: @conreview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conreview
    assert_response :success
  end

  test "should update conreview" do
    patch :update, id: @conreview, conreview: { description: @conreview.description, post_id: @conreview.post_id, provider_id: @conreview.provider_id, rating: @conreview.rating }
    assert_redirected_to conreview_path(assigns(:conreview))
  end

  test "should destroy conreview" do
    assert_difference('Conreview.count', -1) do
      delete :destroy, id: @conreview
    end

    assert_redirected_to conreviews_path
  end
end
