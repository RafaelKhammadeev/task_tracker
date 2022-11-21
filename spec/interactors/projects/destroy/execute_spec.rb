require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }

    context "when params are valid" do
      let(:project) { create :project }
      binding.pry
      it { expect { interactor.run }.to change(Project, :count).by(1) }
    end

    context "when params are invalid" do
      let(:project) { nil }

      let(:expected_error_message) { "Invalid data" }
    end
  end
end
