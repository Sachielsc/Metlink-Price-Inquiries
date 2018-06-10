require_relative '../pageObjects/metlink_home_page'
require 'csv'

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

    # extract data from csv file
    @rows = CSV.read("data/addresses_list.csv")
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
    starting_point1 = @rows[1][1]
    end_point1 = @rows[1][2]

    @browser.check_price(starting_point1, end_point1)
    @browser.tell_price(starting_point1, end_point1)
  end

  it "should display the price from target place to Museum of New Zealand" do
    # Addresses
    starting_point2 = @rows[2][1]
    end_point2 = @rows[2][2]

    @browser.check_price(starting_point2, end_point2)
    @browser.tell_price(starting_point2, end_point2)
  end
end