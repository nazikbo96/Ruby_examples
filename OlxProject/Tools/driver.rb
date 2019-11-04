require 'rubygems'
require 'selenium-webdriver'

def driver
  $driver ||= Selenium::WebDriver.for :chrome
end

def start_test(web_site)
  driver.manage.timeouts.implicit_wait = 5
  driver.manage.window.maximize
  driver.navigate.to web_site
end

def driver_close
  driver.quit
end
