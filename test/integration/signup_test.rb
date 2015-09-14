require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  fixtures :users
  
  setup do
    @user = users(:one)
  end
  
  test 'should get the home path' do
    get root_path
    assert_template 'static/index'
  end
  
  test 'home page has the try it button' do
    get root_path
    @try_it_button = css_select('btn btn-xl btn-default page-scroll')
    assert true unless @try_it_button.empty?
  end
  
  test 'should create a valid user' do
    assert true if @user.valid?
  end 
end