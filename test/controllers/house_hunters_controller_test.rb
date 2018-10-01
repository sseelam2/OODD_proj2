require 'test_helper'

class HouseHuntersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get house_hunters_index_url
    assert_response :success
  end

end
