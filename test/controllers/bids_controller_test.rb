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

  test "should show bid" do
    sign_in users(:user1)
    get :show, id: @bid
    assert_response :success
  end

  test "should destroy bid" do
    sign_in users(:user1)
    assert_difference('Bid.count', -1) do
      delete :destroy, id: @bid
    end

    assert_redirected_to bids_path
  end
end
