require_relative 'site_element.rb'

#define new browser (or driver)
browser=SiteElement.new("http://demo.mahara.org")


#define local variables
username = "chris"
password = "Scsgdtcy3"

#input user name
browser.login_username.send_keys(username)

#input password
browser.login_password.send_keys(password)

#click on submit button
browser.submit_button.click

browser.close_browser