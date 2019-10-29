require 'rubygems'
require 'selenium-webdriver'

$driver = Selenium::WebDriver.for :chrome
$driver.navigate.to "https://uk-ua.facebook.com"
array = $driver.find_elements(:xpath => ("//@href/.."))
(array).each do |x|
  puts x.attribute("href")
end
puts "Count of LINKS: #{(array).length}"

$driver.quit
