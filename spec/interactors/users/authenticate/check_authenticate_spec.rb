require "rails_helper"

describe Users::Authenticate::CheckAuthenticate do
  describe ".call" do
    let(:interactor) { described_class.new(credentials: credentials) }
    let!(:user) { create :user }

    context "when params are valid" do
      let(:credentials) { { email: "admin@admin.ru", password: "123456" } }

      it "successfully work" do
        interactor.run

        expect(interactor.context.user.id).to be user.id
      end
    end

    context "when password is invalid" do
      let(:credentials) { { email: "admin@admin.ru", password: "12345678" } }
      let(:expected_error_message) { [{ message: "Wrong credentials" }] }

      it "fails" do
        interactor.run

        expect(interactor.context.errors).to eq(expected_error_message)
      end
    end

    context "when email is invalid" do
      let(:credentials) { { email: "admin@admin", password: "123456" } }
      let(:expected_error_message) { [{ message: "Wrong credentials" }] }

      it "fails" do
        interactor.run

        expect(interactor.context.errors).to eq(expected_error_message)
      end
    end
  end
end
