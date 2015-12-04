require 'test_helper'

class RefusedTransfersControllerTest < ActionController::TestCase
  setup do
    @refused_transfer = refused_transfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refused_transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refused_transfer" do
    assert_difference('RefusedTransfer.count') do
      post :create, refused_transfer: {  }
    end

    assert_redirected_to refused_transfer_path(assigns(:refused_transfer))
  end

  test "should show refused_transfer" do
    get :show, id: @refused_transfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refused_transfer
    assert_response :success
  end

  test "should update refused_transfer" do
    patch :update, id: @refused_transfer, refused_transfer: {  }
    assert_redirected_to refused_transfer_path(assigns(:refused_transfer))
  end

  test "should destroy refused_transfer" do
    assert_difference('RefusedTransfer.count', -1) do
      delete :destroy, id: @refused_transfer
    end

    assert_redirected_to refused_transfers_path
  end
end
