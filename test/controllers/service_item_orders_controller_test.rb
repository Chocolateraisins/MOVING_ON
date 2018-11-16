require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get order_item_show_url
    assert_response :success
  end

  test "should get index" do
    get order_item_index_url
    assert_response :success
  end

  test "should get edit" do
    get order_item_edit_url
    assert_response :success
  end

end
