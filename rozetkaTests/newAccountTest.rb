require 'rubygems'
require 'selenium-webdriver'
require_relative 'repository'

describe "Creating account  tests" do
   context "When testing rozetka.com.ua page" do

     before(:each) do
       $driver = Selenium::WebDriver.for :chrome
       $driver.manage.timeouts.implicit_wait = 5
       $driver.navigate.to "https://rozetka.com.ua/"
     end

     after(:all) do
       element = $driver.find_element(:xpath => ("//div[contains(@id, 'block_remove_account')]//a[contains(@name, 'profile_accordion_link')]")).click
       element = $driver.find_element(:xpath => ("//img[contains(@class, 'profile-delete-account-check-icon input-check-icon sprite')]")).click
       element = $driver.find_element(:xpath => ("//textarea[contains(@name, 'remove_reason')]"))
       element.send_keys $account.reason
       sleep(3)
       element = $driver.find_element(:xpath => ("//a[contains(@class, 'btn-link-i disabled')]")).click
       sleep(3)
       $driver.quit
     end

      it "should load rozetka.com.ua page, and create new account" do

        element = $driver.find_element(:css => (".header-topline__user-link.link-dashed")).click
        element = $driver.find_element(:css => (".auth-modal__register-link")).click
        element = $driver.find_element(:xpath => ("//input[contains(@name, 'title')]"))
        element.send_keys $account.name
        element = $driver.find_element(:xpath => ("//input[contains(@name, 'login')]"))
        element.send_keys $account.mail
        element = $driver.find_element(:xpath => ("//input[contains(@name, 'password')]"))
        element.send_keys $account.password
        element = $driver.find_element(:xpath => ("//div[contains(@class, 'signup-submit')]//button")).click
        sleep(3)
        exitButton = $driver.find_element(:xpath => ("//a[contains(@id, 'profile_signout')]"))
        expect(!exitButton.nil?).to be true
        exitButton.click
      end

      it "should verify login with new account" do
        element = $driver.find_element(:css => (".header-topline__user-link.link-dashed")).click
        element = $driver.find_element(:xpath => ("//input[contains(@id, 'auth_email')]"))
        element.send_keys $account.mail
        element = $driver.find_element(:xpath => ("//input[contains(@id, 'auth_pass')]"))
        element.send_keys $account.password
        element = $driver.find_element(:css =>(".button.button_color_navy.auth-modal__login-button")).click
        exitButton = $driver.find_element(:xpath => ("//a[contains(@id, 'profile_signout')]"))
        element = $driver.find_element(:css =>(".header-topline__user-link.link-dashed")).click
        expect(!exitButton.nil?).to be true
      end
   end
end
