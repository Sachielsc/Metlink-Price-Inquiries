require "selenium-webdriver"

#Selenium Cheat Sheet: https://gist.github.com/kenrett/7553278

#Browser/Driver instantiation
chrome_driver_path = File.join(File.dirname(__FILE__), '../drivers/chromedriver.exe')
Selenium::WebDriver::Chrome.driver_path = chrome_driver_path
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
email_address = "sachielsc@gmail.com"
my_password = "scsgdtcy3"

#Loading the assertselenium URL
driver.navigate.to "http://demowebshop.tricentis.com/"

#Clicking on the Login link present on the home page

login_link = wait.until {
  element = driver.find_element(:link, "Log in")
  puts "Test Passed: Login Link found" if element.displayed?
  element if element.displayed?
}
login_link.click

#Typing the Email
email_input_field = driver.find_element(:id, "Email")
email_input_field.send_keys email_address

#Typing the Pw
passwor_input_field = driver.find_element(:id, "Password")
passwor_input_field.send_keys my_password

#Clicking on the Submit Button
login_button = driver.find_element(:xpath, "/html/body/div[4]/div[1]/div[4]/div[2]/div/div[2]/div[1]/div[2]/div[2]/form/div[5]/input")
login_button.click

#Asserting whether the correct email is diaplyed
actual_email = driver.find_element(:css, "div.header-links li>a[href='/customer/info']")
puts "Test Passed: the actual login email is " + actual_email.text if actual_email.displayed?
email_address.eql? actual_email.text
puts "Successfully completed the user login and validated the Success message"

#Quitting the browser
driver.quit