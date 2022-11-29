module Types
  module Payloads
    class CreateTaskPayload < Types::BaseObject
      field :task, TaskType, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
