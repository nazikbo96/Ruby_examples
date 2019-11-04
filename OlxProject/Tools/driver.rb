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

def scroll_down
  driver.execute_script('window.scrollTo(0, document.body.scrollHeight)')
end

def wait_untill(el)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until { el }
end
