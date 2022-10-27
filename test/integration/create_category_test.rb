require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_defference 'Category.count', 1 do
      post categories_path, params: {category: { name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_math "Sports", response.body
  end
end
