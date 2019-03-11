require "rails_helper"

context "JobApplications" do
  before { sign_in }

  let(:company) { Company.new(name: "Company#1") }

  it "creates" do
    company.save

    click_link "Job Applications"
    click_link "New Job Application"

    select "Company#1", from: "Company"
    fill_in "Title", with: "JobApplication#1"
    fill_in "Date applied", with: "2018-12-31"

    click_on "Create"

    expect(page).to have_content "Job application was successfully created"
    expect(page).to have_content "TITLE JobApplication#1"
    expect(page).to have_content "COMPANY Company#1"
    expect(page).to have_content "DATE APPLIED December 31, 2018"
  end

  it "updates", js: true do
    JobApplication.create!(
      title: "JobApplication#2",
      company: company,
      date_applied: Date.current,
    )

    click_link "Job Applications"
    click_link "Edit"

    fill_in "Title", with: "Other JobApplication"

    click_on "Update"

    expect(page).to have_content "Job application was successfully updated"
    expect(page).to have_content "TITLE Other JobApplication"
  end

  it "destroy", js: true do
    JobApplication.create!(
      title: "JobApplication#2",
      company: company,
      date_applied: Date.current,
    )

    click_link "Job Applications"
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Job application was successfully destroyed"
    expect(page).to_not have_content "JobApplication#3"
  end
end
