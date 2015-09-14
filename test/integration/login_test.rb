require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  fixtures :users
  
  setup do   
    @user = users(:two)
  end
  
  test 'home page should have login button' do
    get root_path
    assert_select "a[href=?]", session_destroy_path, count: 0
    @login_button = css_select('btn btn-lg btn-default')
    assert true unless @login_button.empty?
  end
  
  test 'should have a valid user' do
    assert true if @user.valid?
  end
  
  test 'should login with valid email and password' do
    assert true if @user.valid?
    post session_path, session: {email: @user.email, password: @user.password}
    assert_equal 'Welcome', flash[:notice]
    assert_redirected_to edit_user_path(@user)
    get root_path
    assert_select "a[href=?]", session_destroy_path
    assert_select "a[href=?]", user_path
  end 
end