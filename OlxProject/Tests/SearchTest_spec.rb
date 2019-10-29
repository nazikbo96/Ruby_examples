require 'rubygems'
require_relative '../Pages/Homepage'

describe "Searching tests" do
  context "When testing olx.ua " do
    it "verify opening olx home page, making unsuccessful search" do
      page = HomePage.new
      page.StartTest()
      page.HomeSearchFieldInput($searhUnsuccessfulItem.searchItem)
      page = page.MakeUnsuccessHomeSearch()
      expect(page.IsSearchUnsuccess()).to be true
    end

    it "verify opening olx home page, making successful search " do
      page = HomePage.new
      page.StartTest()
      page.HomeSearchFieldInput($searhSuccessfulItem.searchItem)
      page = page.MakeSuccessHomeSearch()
      expect(page.IsCorrectSearch($searhSuccessfulItem.searchItem)).to be true
    end

    it "verify opening olx home page, making top search" do
      page = SuccessfulSearchPage.new
      page.MakeTopSearch($top_search_item)
      expect(page.IsCorrectSearch($top_search_item.searchItem)).to be true
    end

    after(:all) do
      DriverClose()
    end

  end
end
