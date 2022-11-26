module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :task, :user, :project, to: :context

      def call
        TaskMailer.task_destroyed_owner(task.title, project, user).deliver_later unless user_owner_check?
        TaskMailer.task_destroyed_initiator(task.title, user).deliver_later
        TaskMailer.task_destroyed_member(task.title, project, user).deliver_later

      end

      def user_owner_check?
        ProjectMembership.find_by(project: project, user: user).owner?
      end
    end
  end
end

