require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "title must be present" do
    task = Task.new(title: "")
    assert !task.valid?, "Task should have a title"
  end

  test "description must be present" do
    task = Task.new(description: "")
    assert !task.valid?, "Task should have a description"
  end

  test "task belongs to user" do
    task = Task.new
    assert_respond_to task, :user
  end

  test "task belongs to category" do
    task = Task.new
    assert_respond_to task, :category
  end

  test "completed defaults to false" do
    task = Task.new
    assert_equal false, task.completed
  end
end