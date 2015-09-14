require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end
  
  test 'should create a valid user' do
    assert true if @user.valid?
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { e_num1: @user.e_num1, e_num2: @user.e_num2, firstname: @user.firstname, lastname: @user.lastname, my_num: @user.my_num, token: @user.token, xid: '1123' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { e_num1: @user.e_num1, e_num2: @user.e_num2, firstname: @user.firstname, lastname: @user.lastname, my_num: @user.my_num, token: @user.token, xid: @user.xid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
