require "test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end
end
