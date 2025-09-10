require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @category = categories(:one) 
    @task = tasks(:one)
    sign_in @user
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_path(@category), params: { 
        task: { title: "New Task", description: "Test description", due_date: Date.current } 
      }
    end
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_path(@category, @task)
    end
  end
end