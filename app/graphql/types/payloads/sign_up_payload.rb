module Types
  module Payloads
    class SignUpPayload < Types::BaseObject
      field :current_user, CurrentUserType, null: false, method: :user
      field :access_token, String, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
