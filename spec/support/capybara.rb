Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: [
        "no-sandbox",
        "headless",
        "disable-popup-blocking",
        "disable-gpu",
        "window-size=1920,1200",
      ],
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.server = :puma, { Silent: true }
Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

module Login
  module Helpers
    def sign_in
      AdminUser.create(email: "admin@example.com", password: "password")

      visit admin_root_path

      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"

      click_on "Login"
    end
  end
end

RSpec.configure do |config|
  config.include Login::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
end
