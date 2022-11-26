module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        TaskMailer.task_created_owner(task, user).deliver_later
        TaskMailer.task_created_member(task, user).deliver_later
      end
    end
  end
end
