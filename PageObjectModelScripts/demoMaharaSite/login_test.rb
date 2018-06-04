require_relative 'site_element.rb'

#define new browser (or driver)
browser=SiteElement.new("http://demo.mahara.org")
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

#define local variables
username = "chris"
password = "Scsgdtcy3"

#input user name
browser.login_username.send_keys(username)

#input password
browser.login_password.send_keys(password)

#click on submit button
browser.submit_button.click

#wait until the Logout link displays, timeout in 10 seconds
wait.until {browser.logout_link }

#if logout link is displayed
isLogoutLinkDisplayed=browser.logout_link.displayed?
puts isLogoutLinkDisplayed

browser.close_browser