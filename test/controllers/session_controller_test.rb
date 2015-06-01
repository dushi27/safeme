require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end
    
  test "should get login page" do
    get :get
    assert_response :success
  end
    
  test "should login the user" do
      post :create, :params => {email: @user.email, password: @user.password}     
    assert_equal 'Welcome', flash[:notice]
  end
  
  test "should logout the user" do
    post :create, :params => {emaill: @user.email, password: @user.password}
    delete :destroy     
    assert_equal 'See you later', flash[:notice]
  end
    
end
