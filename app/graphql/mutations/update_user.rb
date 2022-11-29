module Mutations
  class UpdateUser < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateUserInput

    type Types::Payloads::UpdateUserPayload


    def resolve(input:)
      result = Users::Update.call(user_params: input.to_h, user: current_user)


      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.task))
      end
    end
  end
end
