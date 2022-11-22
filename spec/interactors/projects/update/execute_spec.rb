require "rails_helper"

describe Projects::Update::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project, project_params: params) }

    context "when params are valid" do
      let(:project) { create :project }
      let(:params) do
        { name: "MyTestNameForUpdate" }
      end

      it "it's work" do
        interactor.run

        expect(interactor.context.project.name).to eq(params[:name])
      end
    end

    context "when params are invalid" do
      let(:project) { create :project }
      let(:params) do
        { name: nil }
      end

      let(:expected_error_message) { "Invalid Data" }

      it "fails" do
        interactor.run

        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
