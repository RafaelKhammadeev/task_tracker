module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :task, to: :context

      def call
        TaskMailer.task_updated(task).deliver_later
      end
    end
  end
end
