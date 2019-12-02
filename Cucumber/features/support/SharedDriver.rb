require 'rubygems'
require 'rspec'
require 'watir-webdriver'

include Selenium

browser = Watir::Browser.new :chrome

Before do
  @browser = browser
end
