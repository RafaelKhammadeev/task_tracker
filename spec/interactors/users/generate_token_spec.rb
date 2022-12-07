require "rails_helper"

describe Users::GenerateToken do
  describe ".call" do
    let(:interactor) { described_class.new(user: user) }

    context "when params are valid" do
      let!(:user) { create :user }

      it "successfully work" do
        access_token = JWT.encode({ sub: user.id }, ENV.fetch("JWT_SECRET"), "HS256")
        interactor.run

        expect(interactor.context.access_token).to be == access_token
      end
    end
  end
end
