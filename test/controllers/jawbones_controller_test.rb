require 'test_helper'

class JawbonesControllerTest < ActionController::TestCase
  setup do
    @jawbone = jawbones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jawbones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jawbone" do
    assert_difference('Jawbone.count') do
      post :create, jawbone: { action: @jawbone.action, user_xid: @jawbone.user_xid }
    end

    assert_redirected_to jawbone_path(assigns(:jawbone))
  end

  test "should show jawbone" do
    get :show, id: @jawbone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jawbone
    assert_response :success
  end

  test "should update jawbone" do
    patch :update, id: @jawbone.id, jawbone: { action: @jawbone.action, user_xid: @jawbone.user_xid }
    assert_redirected_to jawbone_path(assigns(:jawbone))
  end

  test "should destroy jawbone" do
    assert_difference('Jawbone.count', -1) do
      delete :destroy, id: @jawbone
    end

    assert_redirected_to jawbones_path
  end
end
