class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: [:index, :today], if: -> { params[:category_id].present? }
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
    @todays_tasks = current_user.tasks.created_today
    @task = Task.new
  end

  def today
    @tasks = current_user.tasks.for_today
  end

  def show
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    @task.user = current_user
    
    if @task.save
      redirect_to @category
    else
      # Make sure you have the data needed for the categories/show template
      @tasks = @category.tasks
      render "categories/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to [@category, @task]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end