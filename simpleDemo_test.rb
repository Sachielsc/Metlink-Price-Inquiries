require "selenium-webdriver"

#Source: https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit