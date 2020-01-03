require 'rubygems'
require 'selenium-webdriver'
require 'net/http'
require "rest-client"

require_relative 'repository'
describe "Searching tests" do
   context "When testing rozetka.com.ua page" do

     before(:each) do
       $driver ||= Selenium::WebDriver.for :chrome
       $driver.manage.timeouts.implicit_wait = 5
       $driver.navigate.to "https://durnevshop.com.ua/bags"
     end

     after(:all) do
       $driver.quit
     end

      it "should" do
        sleep(3)
        uri = URI('https://stat.tildacdn.com/event/')

        $driver.manage.all_cookies.each do |cookie|
          puts cookie[:name]
        end
        puts $driver.manage.cookie_named('tildasid')
        puts $driver.manage.cookie_named('tildauid')

        puts $driver.manage.cookie_named('tildasid')[:value]
        puts $driver.manage.cookie_named('tildauid')[:value]

        res = Net::HTTP.post_form(uri, 'page' => 'durnevshop.com.ua/tilda/cart/add/96628120-1566497074817',
            'referrer' => 'durnevshop.com.ua/bags',
            'userid' => "#{$driver.manage.cookie_named('tildauid')[:value]}",
            'sessionid' => "#{$driver.manage.cookie_named('tildasid')[:value]}",
            'user_agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',
            'user_language' => 'en-US',
            'projectid' => '1190449',
            'pageid' => '5369591',
            'pagealias' => 'bags',
            'formskey' => '21076fe2b2da3132b6ab872d6cbc4081',
            'ismobile' => 'false',
            'tildastatcode' => '6117eb314b78db65ddd3d9c8743b3a8e',
            'tildautm' => '')
        puts res.body

        req = Net::HTTP::Post.new(uri)
        req.set_form_data('page' => 'durnevshop.com.ua/tilda/cart/add/96628120-1566497074817',
            'referrer' => 'durnevshop.com.ua/bags',
            'userid' => "#{$driver.manage.cookie_named('tildauid')[:value]}",
            'sessionid' => "#{$driver.manage.cookie_named('tildasid')[:value]}",
            'user_agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',
            'user_language' => 'en-US',
            'projectid' => '1190449',
            'pageid' => '5369591',
            'pagealias' => 'bags',
            'formskey' => '21076fe2b2da3132b6ab872d6cbc4081',
            'ismobile' => 'false',
            'tildastatcode' => '6117eb314b78db65ddd3d9c8743b3a8e',
            'tildautm' => '')

        res1 = Net::HTTP.start('stat.tildacdn.com') do |http|
          http.request(req)
        end

        case res1
        when Net::HTTPSuccess, Net::HTTPRedirection
          #ok
        else
          res1.value
        end
        puts res1.body

        sleep(2)
        #response = Net::HTTP.get_response('my.rozetka.com.ua', '/checkout/')
        $driver.navigate.refresh
        sleep(3)

      end

  end
end
