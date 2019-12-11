require 'rubygems'
require 'rspec'
require 'selenium-webdriver'

def driver
  $driver ||=Selenium::WebDriver.for :chrome
end

def start_test(web_site)
  driver.manage.timeouts.implicit_wait = 5
  driver.manage.window.maximize
  driver.navigate.to web_site
  LoginPage.new
end
