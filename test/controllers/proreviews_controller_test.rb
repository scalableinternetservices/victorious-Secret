require 'test_helper'

class ProreviewsControllerTest < ActionController::TestCase
  setup do
    @proreview = proreviews(:one)
  end

  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
    assert_not_nil assigns(:proreviews)
  end

  test "should show proreview" do
    sign_in users(:user1)
    get :show, id: @proreview
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get :edit, id: @proreview
    assert_response :success
  end


  test "should destroy proreview" do
    sign_in users(:user1)
    assert_difference('Proreview.count', -1) do
      delete :destroy, id: @proreview
    end

    assert_redirected_to proreviews_path
  end
end
