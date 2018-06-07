require 'selenium-webdriver'
include RSpec::Matchers

class MetlinkHomePage

  #Web elements
  def sign_in_link
    @driver.find_element(:css, "div.navbar-right-holder li>a[title='Sign In']")
  end

  def log_out_link
    @driver.find_element(:css, "div.navbar-right-holder li>a[title='Log out']")
  end

  def email_input_field
    @driver.find_element(:id, "CustomMemberLoginForm_LoginForm_Email")
  end

  def password_input_field
    @driver.find_element(:id, "CustomMemberLoginForm_LoginForm_Password")
  end

  def sign_in_button
    @driver.find_element(:id, "CustomMemberLoginForm_LoginForm_action_dologin")
  end

  def from_location_input_field
    @driver.find_element(:id, "JourneyPlannerForm_JourneyPlannerForm_From")
  end

  def to_location_input_field
    @driver.find_element(:id, "JourneyPlannerForm_JourneyPlannerForm_To")
  end

  def show_my_journey_button
    @driver.find_element(:id, "JourneyPlannerForm_JourneyPlannerForm_action_doForm")
  end

  def fares_list
    @driver.find_element(:css, "div.fares__list-wrapper")
  end

  def adult_cash
    @driver.find_elements(:css, "div.fares__right>span.fares__price")[0]
  end

  def child_cash
    @driver.find_elements(:css, "div.fares__right>span.fares__price")[1]
  end

  #Web page operations
  def initialize(url)
    chrome_driver_path = File.join(File.dirname(__FILE__), '../drivers/chromedriver.exe')
    Selenium::WebDriver::Chrome.driver_path = chrome_driver_path

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument('--disable-infobars')

    @driver = Selenium::WebDriver.for :chrome, options: options
    @driver.manage.window.maximize
    @driver.navigate.to url
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
  end

  def close_browser
    log_out_link.click
    @driver.quit
  end

  def check_price(from_location, to_location)
    from_location_input_field.send_keys from_location
    to_location_input_field.send_keys to_location

    #assertion
    #expect(from_location_input_field.text).to eq from_location
    #expect(to_location_input_field.text).to eq to_location

    show_my_journey_button.click
  end

  def tell_price
    puts "\nAdult Cash: " + adult_cash.text + "\nChild Cash: " + child_cash.text if @wait.until {fares_list.displayed?}
  end
end