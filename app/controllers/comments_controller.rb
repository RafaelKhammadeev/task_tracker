class CommentsController < ApplicationController
  before_action :set_task
  before_action :set_project
  before_action :set_comment, only: %i[edit update destroy]
  before_action -> { authorize! @comment, with: CommentPolicy }
  # коменты должны отображаться в task_show

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created."
    else
      flash.now[:alert] = "Something went wrong. Try again."
      render "tasks/show"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully updated."
    else
      flash.now[:alert] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_task_path(@project, @task), notice: "Comment was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :content, :task_id, :user_id)
  end
end
