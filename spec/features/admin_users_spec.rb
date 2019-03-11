require "rails_helper"

context "AdminUser" do
  before { sign_in }

  let(:admin_user) do
    AdminUser.create(
      email: "other@example.com",
      password: :password,
    )
  end

  it "creates" do
    click_link "Admin Users"
    click_link "New Admin User"

    fill_in "Email", with: "user@example.com"
    fill_in "Password*", with: "secret"
    fill_in "Password confirmation", with: "secret"

    click_on "Create"

    expect(page).to have_content "Admin user was successfully created"
    expect(page).to have_content "EMAIL user@example.com"
  end

  it "updates", js: true do
    admin_user.save

    click_link "Admin Users"
    within "#admin_user_#{admin_user.id}" do
      click_link "Edit"
    end

    fill_in "Email", with: "otherone@example.com"
    fill_in "Password*", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Update"

    expect(page).to have_content "Admin user was successfully updated"
    expect(page).to have_content "EMAIL otherone@example.com"
  end

  it "destroy", js: true do
    admin_user.save

    click_link "Admin Users"
    within "#admin_user_#{admin_user.id}" do
      click_on "Delete"
    end
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Admin user was successfully destroyed"
    expect(page).to_not have_content "other@example.com"
  end
end
