module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: true
    field :title, String
    field :description, String
    field :deadline_at, GraphQL::Types::ISO8601DateTime
    field :project_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime
    field :updated_at, GraphQL::Types::ISO8601DateTime
    field :state, String
    field :project, ProjectType, null: false
    field :comments, [CommentType], null: false
  end
end
