require 'rubygems'
require_relative '../tools/all_requires'

describe "Logging tests" do
  let(:fb_account) {User.new("nazar-y96@ukr.net","123546")}

  after(:all) do
    driver_close
  end

  context "When testing olx.ua " do
    it "logging with fb account " do
      page = HomePage.new
      start_test
      page = page.top_login_button_click
      page = page.loging(fb_account)
      expect(page).to be_a(UserPage)
      expect(page.user_page_loaded?).to be true
    end

  end
end
