require 'test_helper'

class RoadmapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roadmap_index_url
    assert_response :success
  end

end
