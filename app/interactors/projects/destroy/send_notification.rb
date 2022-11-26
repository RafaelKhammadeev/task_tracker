module Projects
  class Destroy
    class SendNotification
      include Interactor

      delegate :project, :project_user_email, to: :context

      def call
        ProjectMailer.project_destroyed(project.name, project_user_email).deliver_later
      end
    end
  end
end
