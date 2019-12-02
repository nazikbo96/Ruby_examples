require 'rubygems'
require 'rspec'
require 'selenium-webdriver'

def driver
  Selenium::WebDriver.for :chrome
end

def start_test(web_site)
  @driver = driver
  @driver.manage.timeouts.implicit_wait = 5
  @driver.manage.window.maximize
  @driver.navigate.to "https://demo.openmrs.org/openmrs/login.htm"
  LoginPage.new(@driver)
end
