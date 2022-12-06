module Mutations
  class UpdateUser < BaseMutation
    include AuthenticableGraphqlUser
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateUserInput

    type Types::Payloads::UpdateUserPayload

    def resolve(input:)
      result = Users::Save.call(user_params: input.to_h)

      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.user))
      end
    end
  end
end
