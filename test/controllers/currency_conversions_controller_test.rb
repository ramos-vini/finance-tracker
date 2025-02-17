require "test_helper"

class CurrencyConversionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get currency_conversions_search_url
    assert_response :success
  end
end
