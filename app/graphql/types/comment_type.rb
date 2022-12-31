module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: true
    field :content, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    field :task, TaskType, null: false
  end
end
