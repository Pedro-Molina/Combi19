require 'test_helper'

class ChofersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chofers_index_url
    assert_response :success
  end

end
