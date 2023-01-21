require "test_helper"

class DisbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index with 2 records" do
    get root_url

    assert_response 200
    assert_equal 2, JSON.parse(@response.body).size
  end
end
