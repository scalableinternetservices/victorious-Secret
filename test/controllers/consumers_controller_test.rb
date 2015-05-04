require 'test_helper'

class ConsumersControllerTest < ActionController::TestCase
  setup do
    @consumer = consumers(:one)
  end

  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
    assert_not_nil assigns(:consumers)
  end

  test "should get new" do
    sign_in users(:user1)
    get :new
    assert_response :success
  end

  test "should create consumer" do
    sign_in users(:user1)
    assert_difference('Consumer.count') do
      post :create, consumer: { rating: @consumer.rating, user_id: @consumer.user_id }
    end

    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should show consumer" do
    sign_in users(:user1)
    get :show, id: @consumer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get :edit, id: @consumer
    assert_response :success
  end

  test "should update consumer" do
    sign_in users(:user1)
    patch :update, id: @consumer, consumer: { rating: @consumer.rating, user_id: @consumer.user_id }
    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should destroy consumer" do
    sign_in users(:user1)
    assert_difference('Consumer.count', -1) do
      delete :destroy, id: @consumer
    end

    assert_redirected_to consumers_path
  end
end
