require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get candidats" do
    get admin_candidats_url
    assert_response :success
  end

  test "should get valides" do
    get admin_valides_url
    assert_response :success
  end

end
