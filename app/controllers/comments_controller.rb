class CommentsController < ApplicationController
  # коменты должны отображаться в task_show

  # здесь должны отображаться создаваться комменты
  # а я их пытался создать в контроллере task
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created."
    else
      @comment.destroy
      flash.now[:alert] = "Something went wrong. Try again."
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to projects_url, notice: "comment was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :task_id, :user_id)
  end

end
