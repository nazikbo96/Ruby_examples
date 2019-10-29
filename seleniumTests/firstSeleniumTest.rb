require 'rubygems'
require 'selenium-webdriver'

describe 'ChromeTest' do
   before(:each) do
     $driver = Selenium::WebDriver.for :chrome
     $driver.navigate.to "https://rozetka.com.ua"
   end
   
   it 'should load google page and find WebDriver ' do
     element = $driver.find_element(class: 'gLFyf')
     element.send_keys "WebDriver!"
     element.submit
     puts $driver.title
     $driver.quit
   end

   it 'should go to facebook log page and login' do
     element = $driver.find_element(class: 'gLFyf')
     element.send_keys "facebook"
     sleep(2)
     element.submit
     $driver.find_element(:xpath => ("//div[contains(@class, 'r')]//h3[contains(text(),'Facebook — увійдіть')]")).click
     sleep(2)
     element = $driver.find_element(:css, ("#u_0_m"))
     element.send_keys "nazarnazar"
     sleep(2)

   end
end
