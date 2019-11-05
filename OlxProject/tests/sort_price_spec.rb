require 'rubygems'
require_relative '../tools/all_requires'

describe "Sorting price tests" do

  let( :home_search ) { SearchItem.new("MacBook") }
  let( :web_site    ) { "https://www.olx.ua/" }

  context "When testing olx.ua " do

    after(:all) do
      driver_close
    end

    it "verify opening olx home page, making successful search " do
      home_page = HomePage.new
      start_test(web_site)
      home_page.home_search_field_input(home_search.searchItem)
      successful_search_page = home_page.make_home_search
      expect(successful_search_page.not_correct_search?(home_search.searchItem)).to be false
    end

    it "verify asc sort" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.sort_price_asc
      expect(successful_search_page.is_sorted_price_asc?).to be true
    end

    it "verify desc sort" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.sort_price_desc
      expect(successful_search_page.is_sorted_price_desc?).to be true
    end

  end
end
