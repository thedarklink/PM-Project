require 'test_helper'

class BurndownControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get burndown_index_url
    assert_response :success
  end

end
