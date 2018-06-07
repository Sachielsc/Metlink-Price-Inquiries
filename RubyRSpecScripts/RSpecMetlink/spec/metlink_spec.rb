require 'selenium-webdriver'
require 'rspec'
require_relative '../pageObjects/metlink_home_page'

describe MetlinkHomePage do

  before(:each) do
    @email = "newzealand1126@gmail.com"
    @password = "Scsgdtcy3"
    home_page_url = "https://www.metlink.org.nz"

    #Go to the home page
    @browser=MetlinkHomePage.new(home_page_url)
  end

  after(:each) do
    @browser.close_browser
  end

  it "should display the path and price" do
    @browser.sign_in_link.click
    @browser.email_input_field.send_keys @email
    @browser.password_input_field.send_keys @password
    @browser.sign_in_button.click

    #assertion
    #expect(@browser.customer_info.text).to eq @email
  end
end