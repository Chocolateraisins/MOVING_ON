require 'test_helper'

class ServiceItemOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get service_item_order_show_url
    assert_response :success
  end

  test "should get index" do
    get service_item_order_index_url
    assert_response :success
  end

  test "should get edit" do
    get service_item_order_edit_url
    assert_response :success
  end

end
