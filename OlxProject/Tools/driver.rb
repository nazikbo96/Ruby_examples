require 'rubygems'
require 'selenium-webdriver'

public def start_test
  $driver = Selenium::WebDriver.for :chrome

  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  $driver.manage.timeouts.implicit_wait = 10
  $driver.manage.window.maximize
  $driver.navigate.to "https://www.olx.ua/"
end

public def driver_close
  $driver.quit
end
