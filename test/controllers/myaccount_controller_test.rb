require 'test_helper'

class MyaccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myaccount_index_url
    assert_response :success
  end

end
