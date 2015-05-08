require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
    assert_not_nil assigns(:bids)
  end

  test "should get new" do
    sign_in users(:user1)
    get :new
    assert_response :success
  end

  test "should create bid" do
    sign_in users(:user1)
    assert_difference('Bid.count') do
      post :create, bid: { amount: @bid.amount, description: @bid.description, post_id: @bid.post_id, provider_id: @bid.provider_id }
    end

    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should show bid" do
    sign_in users(:user1)
    get :show, id: @bid
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get :edit, id: @bid
    assert_response :success
  end

  test "should update bid" do
    sign_in users(:user1)
    patch :update, id: @bid, bid: { amount: @bid.amount, description: @bid.description, post_id: @bid.post_id, provider_id: @bid.provider_id }
    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should destroy bid" do
    sign_in users(:user1)
    assert_difference('Bid.count', -1) do
      delete :destroy, id: @bid
    end

    assert_redirected_to bids_path
  end
end
