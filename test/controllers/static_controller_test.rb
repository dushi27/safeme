require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get home" do
    get:index
    assert_response :success
  end
end
