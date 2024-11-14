require "test_helper"

class KanbanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kanban_index_url
    assert_response :success
  end

  test "should get update_status" do
    get kanban_update_status_url
    assert_response :success
  end
end
