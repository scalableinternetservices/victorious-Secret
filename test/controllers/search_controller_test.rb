require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get posts" do
    sign_in users(:user1)
    get :posts
    assert_response :success
  end

end
