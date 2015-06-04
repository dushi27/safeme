require 'test_helper'

class PubsubsControllerTest < ActionController::TestCase
  setup do
    @pubsub = pubsubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pubsubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pubsub" do
    assert_difference('Pubsub.count') do
      post :create, pubsub: { action: @pubsub.action, timestamp: @pubsub.timestamp, type: @pubsub.type, user_xid: @pubsub.user_xid }
    end

    assert_redirected_to pubsub_path(assigns(:pubsub))
  end

  test "should show pubsub" do
    get :show, id: @pubsub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pubsub
    assert_response :success
  end

  test "should update pubsub" do
    patch :update, id: @pubsub, pubsub: { action: @pubsub.action, timestamp: @pubsub.timestamp, type: @pubsub.type, user_xid: @pubsub.user_xid }
    assert_redirected_to pubsub_path(assigns(:pubsub))
  end

  test "should destroy pubsub" do
    assert_difference('Pubsub.count', -1) do
      delete :destroy, id: @pubsub
    end

    assert_redirected_to pubsubs_path
  end
end
