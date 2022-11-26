module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :task, :user, :project, to: :context

      def call
        send_mail_owner.deliver_later unless user_owner_check?
        TaskMailer.task_destroyed_initiator(task.title, user).deliver_later
        TaskMailer.task_destroyed_member(task.title, project, user).deliver_later
      end

      private

      def user_owner_check?
        ProjectMembership.find_by(project: project, user: user).owner?
      end

      def send_mail_owner
        TaskMailer.task_destroyed_owner(task.title, project, user)
      end
    end
  end
end
