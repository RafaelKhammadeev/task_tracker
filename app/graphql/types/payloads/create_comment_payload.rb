module Types
  module Payloads
    class CreateCommentPayload < Types::BaseObject
      field :comment, CommentType, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
