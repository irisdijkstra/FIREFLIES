require "test_helper"

class FirefliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fireflies_create_url
    assert_response :success
  end

  test "should get show" do
    get fireflies_show_url
    assert_response :success
  end
end
