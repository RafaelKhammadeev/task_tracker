module Users
  class GenerateToken
    include Interactor

    delegate :user, to: :context

    def call
      context.fail!(errors: errors) if user.nil?
      context.access_token = access_token
    end

    private

    def errors
      [{ message: "Programmer's mistakes" }]
    end

    def access_token
      JWT.encode(payload, jwt_secret, "HS256")
    end

    def jwt_secret
      ENV.fetch("JWT_SECRET")
    end

    def payload
      {
        sub: user.id
      }
    end
  end
end
