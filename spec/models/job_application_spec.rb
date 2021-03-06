require "rails_helper"

describe JobApplication do
  subject do
    JobApplication.new(
      company: company,
      title: "Senior",
      date_applied: Date.current,
    )
  end

  let(:company) { Company.new(name: "Company#1") }

  it { is_expected.to be_valid }

  it "should not be valid without company" do
    subject.company = nil
    expect(subject).not_to be_valid
  end

  it "should not be valid without title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "should not be valid without date_applied" do
    subject.date_applied = nil
    expect(subject).not_to be_valid
  end
end
