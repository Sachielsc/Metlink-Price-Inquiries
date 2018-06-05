require 'selenium-webdriver'
class SiteElement

  def initialize(url)
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
    @driver.navigate.to url
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  def login_link
    @driver.find_element(:link, "Log in")
  end

  def email_input_field
    @driver.find_element(:id, "Email")
  end

  def password_input_field
    @driver.find_element(:id, "Password")
  end

  def login_button
    @driver.find_element(:xpath, "/html/body/div[4]/div[1]/div[4]/div[2]/div/div[2]/div[1]/div[2]/div[2]/form/div[5]/input")
  end

  def close_browser
    puts "Closing DemoWorkShop ..."
    @driver.quit
  end
end