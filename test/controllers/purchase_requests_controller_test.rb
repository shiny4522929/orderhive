require "test_helper"

class PurchaseRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get purchase_requests_create_url
    assert_response :success
  end

  test "should get index" do
    get purchase_requests_index_url
    assert_response :success
  end

  test "should get update" do
    get purchase_requests_update_url
    assert_response :success
  end

  test "should get destroy" do
    get purchase_requests_destroy_url
    assert_response :success
  end

  test "should get new" do
    get purchase_requests_new_url
    assert_response :success
  end

  test "should get edit" do
    get purchase_requests_edit_url
    assert_response :success
  end

  test "should get show" do
    get purchase_requests_show_url
    assert_response :success
  end
end
