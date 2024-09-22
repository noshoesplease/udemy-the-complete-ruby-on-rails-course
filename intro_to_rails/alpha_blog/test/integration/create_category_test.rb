require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  category_name = "Sports"

  test "get new category form and create category" do
    get new_category_path
    assert_response :success
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: category_name } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match category_name, response.body
  end

  # test "invalid category submission results in failure" do
  #   get new_category_path
  #   assert_template "categories/new"
  #   assert_no_difference "Category.count" do
  #     post categories_path, params: { category: { name: " " } }
  #   end
  #   assert_template "categories/new"
  #   assert_select "h2.panel-title"
  #   assert_select "div.panel-body"
  # end
end
