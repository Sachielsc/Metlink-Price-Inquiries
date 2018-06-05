require_relative '../../pageObjects/home_page_object'
require 'selenium-webdriver'

Given("I navigate to Demo Work Shop homepage") do
  @browser=HomePageObject.new("http://demowebshop.tricentis.com/")
end

When("I click the login button on the home page") do
  @browser.login_link.click
end

When("I type in {string} as my Email") do |email|
  @browser.email_input_field.send_keys email
end

When("I type in {string} as my Password") do |pw|
  @browser.password_input_field.send_keys pw
end

When("I click the login button on the login page") do
  @browser.login_button.click
end

Then("I should be able to see my email {string} on the home page") do |expected_email|
  expect(@browser.customer_info.text).to eq(expected_email)
end