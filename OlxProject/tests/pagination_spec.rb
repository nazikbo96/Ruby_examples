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
      expect(successful_search_page.not_correct_search?(home_search.searchItem)).to be false
    end

    it "verify page number and buttons count at first page " do
      successful_search_page = SuccessfulSearchPage.new
      expect(successful_search_page.correct_page_number?('1')).to be true
      expect(successful_search_page.correct_button_count?(1, 1)).to be true
    end
    it "verify page number and buttons count at second page" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_prev_next_page
      #sleep(3)
      expect(successful_search_page.correct_page_number?('2')).to be true
      expect(successful_search_page.correct_button_count?(2, 0)).to be true
    end
    it "verify page number and buttons count at last page " do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_last_page
      #sleep(3)
      expect(successful_search_page.correct_page_number?('154')).to be true
      expect(successful_search_page.correct_button_count?(1, 1)).to be true
    end
    it "verify page number and buttons count at pre last page" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_prev_next_page
      #sleep(3)
      expect(successful_search_page.correct_page_number?('153')).to be true
      expect(successful_search_page.correct_button_count?(2, 0)).to be true
    end
  end
end
