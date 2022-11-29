module Users
  class Update
    class Execute
      include Interactor

      delegate :user_params, :user, to: :context

      def call
        context.fail!(error: "Nil Data") if user.nil?
        context.fail!(error: "Invalid Data") unless user.update(user_params)
      end
    end
  end
end
