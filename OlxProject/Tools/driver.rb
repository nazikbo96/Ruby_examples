require 'rubygems'
require 'selenium-webdriver'

def driver
  $driver ||= Selenium::WebDriver.for :chrome
end

def start_test
  driver.manage.timeouts.implicit_wait = 10
  driver.manage.window.maximize
  driver.navigate.to "https://www.olx.ua/"
end

def driver_close
  driver.quit
end
