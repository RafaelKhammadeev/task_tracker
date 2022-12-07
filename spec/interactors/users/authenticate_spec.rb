require "rails_helper"

describe Users::Authenticate do
  describe ".organized" do
    let(:expected_interactors) do
      [
        Users::Authenticate::CheckAuthenticate,
        Users::GenerateToken
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
