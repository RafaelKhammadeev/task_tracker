module Users
  class Update
    class Execute
      include Interactor

      delegate :user_params, :user, to: :context

      def call
        context.fail!(error: "Invalid Data") if !user&.update(user_params) && !context.fail!(error: "Invalid Data")
      end
    end
  end
end
