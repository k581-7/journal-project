require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "name must be present" do
    category = Category.new(name: "")
    assert !category.valid?, "Category should have a name"
  end

  test "category belongs to user" do
    category = Category.new
    assert_respond_to category, :user
  end

  test "category has many tasks" do
    category = Category.new
    assert_respond_to category, :tasks
  end

  test "destroying category destroys associated tasks" do
    category = categories(:one)
    task_count = category.tasks.count
    
    assert_difference("Task.count", -task_count) do
      category.destroy
    end
  end
end