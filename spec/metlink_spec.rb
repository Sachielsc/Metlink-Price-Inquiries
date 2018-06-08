require 'selenium-webdriver'
require 'rspec'
require_relative '../pageObjects/metlink_home_page'

describe MetlinkHomePage do

  before(:all) do
    email = "newzealand1126@gmail.com"
    password = "Scsgdtcy3"
    home_page_url = "https://www.metlink.org.nz"

    # Go to the home page
    @browser = MetlinkHomePage.new(home_page_url)

    # Log in
    @browser.sign_in_link.click
    @browser.email_input_field.send_keys email
    @browser.password_input_field.send_keys password
    @browser.sign_in_button.click
  end

  after(:each) do
    @browser.clear_journey_plan
  end

  after(:all) do
    # Logout and close the browser
    @browser.close_browser
  end

  it "should display the price from Wellington central library to target place" do
    # Addresses
    starting_point1 = "65 Victoria St, Wellington, 6011"
    end_point1 = "104 Moorefield Road, Johnsonville, Wellington, New Zealand"

    @browser.check_price(starting_point1, end_point1)
    @browser.tell_price(starting_point1, end_point1)
  end

  it "should display the price from target place to Museum of New Zealand" do
    # Addresses
    starting_point2 = "104 Moorefield Road, Johnsonville, Wellington, New Zealand"
    end_point2 = "55 Cable St, Te Aro, Wellington 6011"

    @browser.check_price(starting_point2, end_point2)
    @browser.tell_price(starting_point2, end_point2)
  end
end