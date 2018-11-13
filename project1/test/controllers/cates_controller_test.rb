require 'test_helper'

class CatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cates_index_url
    assert_response :success
  end

end
