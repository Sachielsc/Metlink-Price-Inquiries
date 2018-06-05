require_relative 'pageObjects/home_page_object.rb'

#define new browser (or driver)
browser=SiteElement.new("http://demowebshop.tricentis.com/")

#define local variables
email = "sachielsc@gmail.com"
password = "scsgdtcy3"

#test steps
browser.login_link.click
browser.email_input_field.send_keys email
browser.password_input_field.send_keys password
browser.login_button.click

browser.close_browser