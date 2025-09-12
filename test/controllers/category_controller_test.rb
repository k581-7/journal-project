require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: "New category" } }
    end
    assert_redirected_to category_url(Category.last)
  end

  # test "should not create category with invalid data" do
  #   assert_no_difference("Category.count") do
  #     post categories_url, params: { category: { name: "" } }
  #   end
  #   assert_response :success
  #   assert_template "categories/new"
  # end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: "Updated category" } }
    assert_redirected_to category_url(@category)
    @category.reload
    assert_equal "Updated category", @category.name
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end
    assert_redirected_to categories_url
  end
end
