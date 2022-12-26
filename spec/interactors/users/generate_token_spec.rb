require "rails_helper"

describe Users::GenerateToken do
  describe ".call" do
    let(:interactor) { described_class.new(user: user) }

    context "when params are valid" do
      let(:user) { create :user }

      it "successfully work" do
        interactor.run

        expect(interactor.context.access_token).to be_present
      end
    end
  end
end