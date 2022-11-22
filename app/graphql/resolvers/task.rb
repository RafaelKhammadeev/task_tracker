module Resolvers
  class Tasks < Resolvers::Base
    argument :id, ID, require: true

    type Types::TaskType, null: true


    def resolve(**_options)
      ::Task.find_by(id: _options[:id])
    end
  end
end
