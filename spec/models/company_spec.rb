require "rails_helper"

describe Company do
  subject do
    Company.new(name: "Company#1")
  end

  it { is_expected.to be_valid }

  it "should not be valid without name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end
