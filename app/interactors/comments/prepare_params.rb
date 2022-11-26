module Comments
  class PrepareParams
    include Interactor

    delegate :comment_params, :task, :user, to: :context

    def call
      context.comment = comment
    end

    def comment
      @comment ||= Comment.new(comment_params.merge({ task: task, user: user }))
    end
  end
end
