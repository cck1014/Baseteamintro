require 'test_helper'

class TeamintroControllerTest < ActionDispatch::IntegrationTest
  test "should get teamintro" do
    get teamintro_teamintro_url
    assert_response :success
  end

end
