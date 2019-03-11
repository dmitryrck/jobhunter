require "rails_helper"

context "Companies" do
  before { sign_in }

  it "creates" do
    click_link "Companies"
    click_link "New Company"

    fill_in "Name", with: "Company#1"

    click_on "Create"

    expect(page).to have_content "Company was successfully created"
    expect(page).to have_content "NAME Company#1"
  end

  it "updates", js: true do
    Company.create(name: "Company#2")

    click_link "Companies"
    click_link "Edit"

    fill_in "Name", with: "Other Company"

    click_on "Update"

    expect(page).to have_content "Company was successfully updated"
    expect(page).to have_content "NAME Other Company"
  end

  it "destroy", js: true do
    Company.create(name: "Company#3")

    click_link "Companies"
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Company was successfully destroyed"
    expect(page).to_not have_content "Company#3"
  end
end
