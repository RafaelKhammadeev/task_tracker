module Resolvers
  class Tasks < Resolvers::Base
    argument :id, ID, require: true

    type Types::TaskType, null: true

    def resolve(**options)
      ::Task.find_by(id: options[:id])
    end
  end
end
