require 'selenium-webdriver'
require 'rspec'
require_relative '../pageObjects/metlink_home_page'

describe MetlinkHomePage do

  #Addresses
  library_address = "65 Victoria St, Wellington, 6011"
  museum_address = "55 Cable St, Te Aro, Wellington 6011"
  target_address = "104 Moorefield Road, Johnsonville, Wellington, New Zealand"

  before(:each) do
    email = "newzealand1126@gmail.com"
    password = "Scsgdtcy3"
    home_page_url = "https://www.metlink.org.nz"

    #Go to the home page
    @browser = MetlinkHomePage.new(home_page_url)

    #Log in
    @browser.sign_in_link.click
    @browser.email_input_field.send_keys email
    @browser.password_input_field.send_keys password
    @browser.sign_in_button.click
  end

  after(:each) do
    #Logout and close the browser
    @browser.close_browser
  end

  it "should display the price from target to Museum of New Zealand" do
    @browser.check_price(target_address, museum_address)
    @browser.tell_price
  end
end