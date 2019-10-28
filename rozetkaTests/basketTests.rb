require 'rubygems'
require 'selenium-webdriver'
require_relative 'repository'

describe "Searching tests" do
   context "When testing rozetka.com.ua page" do

     before(:all) do
       $driver = Selenium::WebDriver.for :chrome
       $driver.manage.timeouts.implicit_wait = 3
       $driver.manage.window.maximize
       $driver.navigate.to "https://rozetka.com.ua/"
     end

     after(:all) do
       $driver.quit
     end

      it "should load rozetka.com.ua page, find MacBook and add 2 to basket." do
        element = $driver.find_element(:css => (".search-form__input"))
        element.send_keys $searhItem1.searchItem
        element = $driver.find_element(:css => ("button.button_color_green.button_size_medium.search-form__submit")).click
        sleep(5)
        elements = $driver.find_elements(:xpath => ("//button[contains(@name, 'topurchasesfromcatalog')]"))

        elements[0].click
        actual = $driver.find_element(:xpath => "//h1").text
        puts "Actual: #{actual}"  #########
        sleep(5)
        element = $driver.find_element(:css => ".header-actions__button-title.xhr").click
        sleep(5)
        element = $driver.find_element(:xpath => "//div[contains(@class, 'purchase-title-wrap')]/a")
        expected = element.text
        puts expected
        expect(expected).to eq actual
      end


   end
end
