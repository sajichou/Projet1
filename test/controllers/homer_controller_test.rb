require 'test_helper'

class HomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homer_index_url
    assert_response :success
  end

end
