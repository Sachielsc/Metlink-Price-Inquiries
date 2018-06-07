require "selenium-webdriver"

#Source: https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings
#Source: https://stackoverflow.com/questions/9416578/relative-path-to-your-project-directory

chrome_driver_path = File.join(File.dirname(__FILE__), '../drivers/chromedriver.exe')
Selenium::WebDriver::Chrome.driver_path = chrome_driver_path

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')
options.add_argument('--disable-infobars')

driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit