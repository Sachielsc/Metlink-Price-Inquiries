require 'selenium-webdriver'

class MetlinkHomePage

  def initialize(url)
    chrome_driver_path = File.join(File.dirname(__FILE__), '../../../drivers/chromedriver.exe')
    Selenium::WebDriver::Chrome.driver_path = chrome_driver_path

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument('--disable-infobars')

    @driver = Selenium::WebDriver.for :chrome, options: options
    @driver.manage.window.maximize
    @driver.navigate.to url
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

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

  # def customer_info
  #   @driver.find_element(:css, "input[name='Email']")
  # end

  def close_browser
    log_out_link.click
    @driver.quit
  end
end