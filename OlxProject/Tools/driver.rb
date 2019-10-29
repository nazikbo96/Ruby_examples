require 'rubygems'
require 'selenium-webdriver'

public def StartTest
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.timeouts.implicit_wait = 5
  $driver.manage.window.maximize
  $driver.navigate.to "https://www.olx.ua/"
end

public def DriverClose
  $driver.quit
end
