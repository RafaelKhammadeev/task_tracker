module Types
  module Payloads
    class CreateTaskPayload < Types::BaseObject
      field :task, TaskType, null: false
      field :errors, [Types::UserError], null: true
    end
  end
end
