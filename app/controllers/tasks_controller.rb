class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  private

  # Strong parameters
  def task_params
    # Forbidden object 👇
    params.require(:task).permit(:title, :details)
  end
end
