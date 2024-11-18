require "test_helper"

class RestaursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurs_index_url
    assert_response :success
  end
end
