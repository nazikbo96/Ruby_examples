require 'rubygems'
require 'selenium-webdriver'
COUNT_OF_LINKS = 139

describe "LinksTest" do
   context "When testing tutorialspoint page" do

     before(:each) do
       $driver = Selenium::WebDriver.for :chrome
       $driver.navigate.to "https://www.tutorialspoint.com/index.htm"
     end
     
     after(:all) do
       $driver.quit
     end

      it "should load tutorialspoint page, find and write to console all links" do

        linksArray = $driver.find_elements(:xpath => ("//@href/.."))
        (linksArray).each do |x|
          puts x.attribute("href")
        end
        puts "Count of LINKS: #{(linksArray).length}"
        expect(COUNT_OF_LINKS).to eq linksArray.length
      end
   end
end
