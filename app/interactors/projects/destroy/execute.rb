module Projects
  class Destroy
    class Execute
      include Interactor

      delegate :project, to: :context

      def call
        # Проверка на существование проекта
        context.fail!(error: "Invalid Data") unless Project.exists?(project.id)

        context.fail!(error: "Invalid Data") unless project.destroy
      end
    end
  end
end
