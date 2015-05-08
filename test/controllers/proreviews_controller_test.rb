require 'test_helper'

class ProreviewsControllerTest < ActionController::TestCase
  setup do
    @proreview = proreviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proreviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proreview" do
    assert_difference('Proreview.count') do
      post :create, proreview: { consumer_id: @proreview.consumer_id, description: @proreview.description, post_id: @proreview.post_id, rating: @proreview.rating }
    end

    assert_redirected_to proreview_path(assigns(:proreview))
  end

  test "should show proreview" do
    get :show, id: @proreview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proreview
    assert_response :success
  end

  test "should update proreview" do
    patch :update, id: @proreview, proreview: { consumer_id: @proreview.consumer_id, description: @proreview.description, post_id: @proreview.post_id, rating: @proreview.rating }
    assert_redirected_to proreview_path(assigns(:proreview))
  end

  test "should destroy proreview" do
    assert_difference('Proreview.count', -1) do
      delete :destroy, id: @proreview
    end

    assert_redirected_to proreviews_path
  end
end
