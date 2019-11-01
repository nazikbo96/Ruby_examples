require 'rubygems'
require_relative '../tools/all_requires'

describe "Register tests" do
  context "When testing olx.ua " do
    let(:fb_account) {User.new("nazar-y96@ukr.net","123546")}

    after(:all) do
      driver_close
    end

    it "register account " do
      page = HomePage.new
      start_test
      page = page.top_login_button_click
      page.registration(fb_account)
    end

  end
end
