require 'rubygems'
require 'selenium-webdriver'

describe "Searching tests" do
   context "When testing rozetka.com.ua page" do

     before(:each) do
       $driver = Selenium::WebDriver.for :chrome
       $driver.manage.timeouts.implicit_wait = 5
       $driver.navigate.to "https://google.com"
     end

     after(:all) do
       $driver.quit
     end

      it "should load google.com page, search 'Ruby', parse the search results
and go to the third one from the end" do
        element = $driver.find_element(:xpath => ("//input[contains(@name, 'q')]"))
        element.send_keys "Ruby"
        element.submit
        elements = $driver.find_elements(:xpath => ("//h3[contains(@class, 'LC20lb')]"))
        elements[elements.length-3].click
      end

   end
end
