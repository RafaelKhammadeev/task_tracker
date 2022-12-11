module Mutations
  class SignIn < Mutations::BaseMutation
    argument :input, Types::Inputs::SignInInput, required: true

    type Types::Payloads::SignInPayload

    def resolve(input:)
      result = Users::Authenticate.call(credentials: input.to_h)

      result.to_h.merge(errors: result.errors)
    end
  end
end
