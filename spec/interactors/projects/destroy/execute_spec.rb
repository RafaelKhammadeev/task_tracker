require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }

    context "when params are valid" do
      let(:project) { create :project }

      it { expect { interactor.run }.to change(Project.all, :count).by(-1) }
    end

    context "when params are invalid" do
      let(:project) { nil }

      let(:expected_error_message) { "Invalid Data" }

      it "fails" do
        interactor.run

        expect(Project.exists?(project.id)).to be false
        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
