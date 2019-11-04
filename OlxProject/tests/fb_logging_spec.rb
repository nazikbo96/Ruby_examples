require 'rubygems'
require_relative '../tools/all_requires'

describe "Logging tests" do

  let( :fb_account ) { User.new("nazar-y96@ukr.net","123546") }
  let( :web_site   ) { "https://www.olx.ua/" }

  context "When testing olx.ua " do

    after(:all) do
      driver_close
    end

    it "logging with fb account " do
      home_page = HomePage.new
      start_test(web_site)
      login_page = home_page.top_login_button_click
      user_page = login_page.loging(fb_account)
      expect(user_page).to be_a(UserPage)
      expect(user_page.user_page_loaded?).to be true
    end

  end
end
