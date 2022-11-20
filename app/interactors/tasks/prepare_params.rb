module Tasks
  class PrepareParams
    include Interactor

    delegate :task_params, :project, to: :context

    def call
      context.task = task
    end

    def task
      @task ||= Task.new(task_params.merge({ project: project }))
    end
  end
end
