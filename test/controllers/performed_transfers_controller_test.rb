require 'test_helper'

class PerformedTransfersControllerTest < ActionController::TestCase
  setup do
    @performed_transfer = performed_transfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performed_transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performed_transfer" do
    assert_difference('PerformedTransfer.count') do
      post :create, performed_transfer: {  }
    end

    assert_redirected_to performed_transfer_path(assigns(:performed_transfer))
  end

  test "should show performed_transfer" do
    get :show, id: @performed_transfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performed_transfer
    assert_response :success
  end

  test "should update performed_transfer" do
    patch :update, id: @performed_transfer, performed_transfer: {  }
    assert_redirected_to performed_transfer_path(assigns(:performed_transfer))
  end

  test "should destroy performed_transfer" do
    assert_difference('PerformedTransfer.count', -1) do
      delete :destroy, id: @performed_transfer
    end

    assert_redirected_to performed_transfers_path
  end
end
