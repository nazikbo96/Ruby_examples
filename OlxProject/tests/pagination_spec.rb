require 'rubygems'
require_relative '../tools/all_requires'

describe "Pagination tests" do

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
      expect(successful_search_page.next_page_button_available?).to be false
      expect(successful_search_page.prev_page_button_available?).to be true
    end
    it "verify page number and buttons count at second page" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_next_page
      expect(successful_search_page.correct_page_number?('2')).to be true
      expect(successful_search_page.next_page_button_available?).to be false
      expect(successful_search_page.prev_page_button_available?).to be false
    end
    it "verify page number and buttons count at last page " do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_last_page
      expect(successful_search_page.correct_page_number?('156')).to be true
      expect(successful_search_page.next_page_button_available?).to be true
      expect(successful_search_page.prev_page_button_available?).to be false
    end
    it "verify page number and buttons count at pre last page" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.goto_prev_page
      expect(successful_search_page.correct_page_number?('155')).to be true
      expect(successful_search_page.next_page_button_available?).to be false
      expect(successful_search_page.prev_page_button_available?).to be false
    end
  end
end
