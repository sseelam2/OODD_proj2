require 'test_helper'

class RealtorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get realtors_index_url
    assert_response :success
  end

end
