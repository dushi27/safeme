require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
end
