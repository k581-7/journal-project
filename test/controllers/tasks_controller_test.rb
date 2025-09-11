require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_category_task_url(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post category_tasks_url(@category), params: { task: { title: "New task", description: "desc", due_date: "2025-09-30" } }
    end
    assert_redirected_to category_url(@category)  # ✅ match controller
  end

  # test "should not create task with invalid data" do
  #   assert_no_difference("Task.count") do
  #     post category_tasks_url(@category), params: { task: { title: "" } }
  #   end
  #   assert_response :success
  #   assert_template "categories/show"
  # end

  test "should show task" do
    get category_task_url(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_url(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_url(@category, @task), params: { task: { title: "Updated" } }
    assert_redirected_to category_task_url(@category, @task)
    @task.reload
    assert_equal "Updated", @task.title
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_url(@category, @task)
    end
    assert_redirected_to category_url(@category)
  end
end
