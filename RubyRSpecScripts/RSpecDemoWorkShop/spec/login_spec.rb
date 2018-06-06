require 'selenium-webdriver'
require 'rspec'
require_relative '../pageObjects/home_page_object'

describe HomePageObject do

  before(:each) do
    @email = "sachielsc@gmail.com"
    @password = "scsgdtcy3"
    home_page_url = "http://demowebshop.tricentis.com/"

    #define new browser (or driver)
    @browser=HomePageObject.new(home_page_url)
  end

  after(:each) do
    @browser.close_browser
  end

  it "should login successfully" do
    @browser.login_link.click
    @browser.email_input_field.send_keys @email
    @browser.password_input_field.send_keys @password
    @browser.login_button.click

    #assertion
    expect(@browser.customer_info.text).to eq @email
  end

  it "should fail to log in" do
    @browser.login_link.click
    @browser.email_input_field.send_keys @email
    @browser.password_input_field.send_keys @password
    @browser.login_button.click

    #assertion
    expect(@browser.customer_info.text).not_to eq @email
  end
end