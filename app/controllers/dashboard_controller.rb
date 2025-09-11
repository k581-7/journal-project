class DashboardController < ApplicationController
before_action :authenticate_user!

  def index
  @users = [ current_user ]
  @categories = current_user.categories
  @tasks = current_user.tasks.joins(:category).includes(:category)
  # @tasks = current_user.tasks.includes(:category)
  # @tasks = @category.tasks
end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
