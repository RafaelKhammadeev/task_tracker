module Projects
  class Destroy
    class Execute
      include Interactor

      delegate :project, to: :context

      def call
        project.destroy
      end
    end
  end
end
