module Comments
  class Save
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Invalid data") unless comment.save
    end
  end
end
