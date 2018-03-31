require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get monespace" do
    get pages_monespace_url
    assert_response :success
  end

end
