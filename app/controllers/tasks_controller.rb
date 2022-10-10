class TasksController < ApplicationController
  # set_task - приватная функция в данном классе
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_project, only: %i[show edit update destroy new]

  def index
    # Task.all появляются с модели (при наследовании от ApplicationRecord)
    @tasks = Task.all
    @project = Project.find(params[:project_id])
  end

  def show
  end

  # здесь используется @task за место @tasks, так как
  def new
    @task = Task.new
    # @project тоже должно создаваться так оно используется в формах
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    # блин круто, менять параметр можно в самом контроле
    @task.deadline_at = 7.days.after

    if @task.save
      # project_task_path(task)
      redirect_to project_tasks_path
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path, notice: "Task was successfully created."
    else
      # флэш тоже не срабатывает
      flash.now[:task_notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to projects_url, notice: "Task was successfully destroyed."
  end

  private

  def set_task
    # можно выводить данные
    # p "hello there"
    # p params[:project_id]
    # find_by ищет первое совпадение
    # find_by bang version is find_by!
    # Task.find_by!(id: params[:id]) равнозначно
    # Task.find(id: params[:id])
    @task = Task.find_by!(id: params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline_at, :project_id)
  end
end
