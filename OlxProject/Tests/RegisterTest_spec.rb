require 'rubygems'
require_relative '../Pages/HomePage'

describe "Register tests" do
  context "When testing olx.ua " do
    it "register account " do
      page = HomePage.new
      page.StartTest()
      page = page.TopLoginButtonClick()
      page.RegisterTab()
      
    end

    after(:all) do
      DriverClose()
    end

  end
end
