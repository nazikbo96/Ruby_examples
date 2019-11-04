require 'rubygems'
require_relative '../tools/all_requires'

describe "Register tests" do

    let(:fb_account) {User.new("nazar-y96@ukr.net","123546")}
    let( :web_site   ) { "https://www.olx.ua/" }

    context "When testing olx.ua " do

      after(:all) do
        driver_close
      end

      it "register account " do
        home_page = HomePage.new
        start_test(web_site)
        register_page = home_page.top_login_button_click
        register_page.registration(fb_account)
      end

  end
end
