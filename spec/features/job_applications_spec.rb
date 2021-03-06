require "rails_helper"

context "JobApplications" do
  before { sign_in }

  let(:company) { Company.new(name: "Company#1") }

  it "scopes to active" do
    company.save

    JobApplication.create(
      date_applied: Date.current,
      company: company,
      title: "Inactive#1",
      accepting_applications: true,
      refused: true,
    )

    JobApplication.create(
      date_applied: Date.current,
      company: company,
      title: "Active#1",
      accepting_applications: true,
      refused: false,
    )

    JobApplication.create(
      date_applied: Date.current,
      company: company,
      title: "Inactive#2",
      accepting_applications: false,
      refused: false,
    )

    JobApplication.create(
      date_applied: Date.current,
      company: company,
      title: "Inactive#3",
      accepting_applications: false,
      refused: true,
    )

    click_link "Job Applications"
    expect(page).to have_content "Active#1"
    expect(page).to have_content "Inactive#1"
    expect(page).to have_content "Inactive#2"
    expect(page).to have_content "Inactive#3"

    within ".scopes" do
      click_link "Active"
    end

    expect(page).to have_content "Active#1"
    expect(page).not_to have_content "Inactive#1"
    expect(page).not_to have_content "Inactive#2"
    expect(page).not_to have_content "Inactive#3"
  end

  it "creates" do
    company.save

    click_link "Job Applications"
    click_link "New Job Application"

    expect(page).to have_field "Date applied", with: Date.current.to_s
    select "Company#1", from: "Company"
    fill_in "Title", with: "JobApplication#1"
    fill_in "Date applied", with: "2018-12-31"
    check "Accepting applications"

    click_on "Create"

    expect(page).to have_content "Job application was successfully created"
    expect(page).to have_content "TITLE JobApplication#1"
    expect(page).to have_content "COMPANY Company#1"
    expect(page).to have_content "DATE APPLIED December 31, 2018"
    expect(page).to have_content "ACCEPTING APPLICATIONS YES"
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
    uncheck "Accepting applications"

    click_on "Update"

    expect(page).to have_content "Job application was successfully updated"
    expect(page).to have_content "TITLE Other JobApplication"
    expect(page).to have_content "ACCEPTING APPLICATIONS NO"
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
