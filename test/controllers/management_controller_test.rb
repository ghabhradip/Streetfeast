require 'test_helper'

class ManagementControllerTest < ActionController::TestCase
  test "should get show_users" do
    get :show_users
    assert_response :success
  end

end
