require 'test_helper'

class MlbPlayerSearchApiControllerTest < ActionDispatch::IntegrationTest
  test "should get mlb_player_search_api" do
    get mlb_player_search_api_mlb_player_search_api_url
    assert_response :success
  end

end
