require "rails_helper"

describe Job do
  subject do
    Job.new(title: "Contact#1")
  end

  it { is_expected.to be_valid }

  it "should not be valid without title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end
end
