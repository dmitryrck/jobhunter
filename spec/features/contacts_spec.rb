require "rails_helper"

context "Contacts" do
  before { sign_in }

  it "creates" do
    click_link "Contacts"
    click_link "New Contact"

    fill_in "Name", with: "Contact#1"

    click_on "Create"

    expect(page).to have_content "Contact was successfully created"
    expect(page).to have_content "NAME Contact#1"
  end

  it "updates", js: true do
    Contact.create(name: "Contact#2")

    click_link "Contacts"
    click_link "Edit"

    fill_in "Name", with: "Other Contact"

    click_on "Update"

    expect(page).to have_content "Contact was successfully updated"
    expect(page).to have_content "NAME Other Contact"
  end

  it "destroy", js: true do
    Contact.create(name: "Contact#3")

    click_link "Contacts"
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Contact was successfully destroyed"
    expect(page).to_not have_content "Contact#3"
  end
end
