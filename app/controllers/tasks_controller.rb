class TasksController < ApplicationController
  def index
    # Task.all появляются с модели (при наследовании от ApplicationRecord)
    @tasks = Task.all
  end

  # здесь используется @task за место @tasks, так как
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline_at, :project_id)
  end
end
