class TasksController < ApplicationController

  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_project, only: %i[show edit update create destroy new index]

  def index
    tasks = []

    Task.all.each do |task|
      tasks << task if task[:project_id].to_s == params[:project_id].to_s
    end

    @tasks = tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    @task.deadline_at = 7.days.after

    if @task.save
      # project_task_path(task)
      redirect_to project_task_path(@project, @task)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path, notice: "Task was successfully created."
    else
      flash.now[:task_notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project), notice: "Task was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline_at, :project_id)
  end
end
