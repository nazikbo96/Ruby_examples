require 'rubygems'
require_relative '../tools/all_requires'

describe "Register tests" do
  context "When testing olx.ua " do
    it "register account " do
      page = HomePage.new
      page.start_test()
      page = page.top_login_button_click()
      page.registration($test_user)
    end

    after(:all) do
      driver_close()
    end

  end
end
