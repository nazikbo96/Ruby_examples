require 'rubygems'
require_relative '../tools/all_requires'

describe "Searching tests" do

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
      successful_search_page.geo_suggestions_close_click
      successful_search_page.delivery_cheack_box_click
      expect(successful_search_page.not_correct_search?(home_search.searchItem)).to be false
      expect(successful_search_page.is_correct_items_with_delivery).to be true
    end

  end
end
