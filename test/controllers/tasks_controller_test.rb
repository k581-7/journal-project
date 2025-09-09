require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @category = categories(:one) 
    @task = tasks(:one)
    sign_in @user
  end

  test "should get index" do
    get tasks_path
    assert_response :success
  end

  test "should get today" do
    get today_tasks_path
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_path(@category), params: { 
        task: { title: "New Task", description: "Test description" } 
      }
    end
    assert_redirected_to category_task_path(@category, Task.last)
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: { 
      task: { title: "Updated Task" } 
    }
    assert_redirected_to category_task_path(@category, @task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_path(@category, @task)
    end
    assert_redirected_to tasks_path
  end

  test "should redirect to login when not signed in" do
    sign_out @user
    get tasks_path
    assert_redirected_to new_user_session_path
  end
end