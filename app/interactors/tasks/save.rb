module Tasks
  class Save
    include Interactor

    delegate :project_task, project, to: :context

    def call
      context.task = task

      context.fail!(error: "Invalid data") unless task.save
    end

    def task
      @task ||= Task.new(task_params.merge({ project: project }))
    end
  end
end