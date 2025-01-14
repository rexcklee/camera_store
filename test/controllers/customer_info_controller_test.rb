require "test_helper"

class CustomerInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_info_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_info_edit_url
    assert_response :success
  end
end
