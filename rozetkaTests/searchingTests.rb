require 'rubygems'
require 'selenium-webdriver'
require_relative 'repository'
describe "Searching tests" do
   context "When testing rozetka.com.ua page" do

     before(:each) do
       $driver = Selenium::WebDriver.for :chrome
       $driver.navigate.to "https://rozetka.com.ua/"
     end

     after(:all) do
       $driver.quit
     end

      it "should load rozetka.com.ua page, type MacBook in search field
      and verify if all founded elements contais 'MacBook' " do

        element = $driver.find_element(:css => (".search-form__input"))
        element.send_keys $searhItem1.searchItem
        element.submit
        element = $driver.find_element(:css => ("button.button_color_green.button_size_medium.search-form__submit")).click
        sleep(3)
        elements = $driver.find_elements(:xpath => ("//div[contains(@class, 'g-i-tile-i-title clearfix')]"))
        sleep(3)
        # for learning only
        (elements).each do |e|
          puts e.text.to_s
        end
        puts "\nResult of method: #{$searhItem1.checker(elements)}"
        puts "\nLength of array: #{elements.length}"
        # for learning only

        expect($searhItem1.checker(elements)).to eq true
      end

      it "should load rozetka.com.ua page, type 'qweqwe' in search field
      and verify if with 'no result' elemens are present on page" do

        element = $driver.find_element(:css => (".search-form__input"))
        element.send_keys $searhItem2.searchItem
        element.submit
        element = $driver.find_element(:css => ("button.button_color_green.button_size_medium.search-form__submit")).click
        sleep(3)
        elements = $driver.find_elements(:xpath => ("//p[contains(@class, 'search-result-title-nothing-text')]"))
        # for learning only
        puts "\nLength of array with 'no result' elemens: #{elements.length}"
        expect(elements).not_to be_empty
      end

   end
end
