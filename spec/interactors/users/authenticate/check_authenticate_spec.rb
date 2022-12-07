require "rails_helper"

describe Users::Authenticate::CheckAuthenticate do
  describe ".call" do
    let(:interactor) { described_class.new(credentials: credentials) }

    context "when params are valid" do
      let(:credentials) { { email: "admin@admin.ru", password: "123456" } }
      let!(:user) { create :user }

      it "successfully work" do
        interactor.run

        expect(interactor.context.user.id).to be == user.id
      end
    end

    context "when params are invalid" do
      let(:credentials) { { email: "admin@admin.ru", password: "12345678" } }
      let!(:user) { create :user }

      let(:expected_error_message) { [{ message: "Wrong credentials" }] }

      it "fails" do
        interactor.run

        expect(interactor.context.errors).to eq(expected_error_message)
      end
    end
  end
end
