require 'rubygems'
require_relative '../tools/all_requires'

describe "Currency change tests" do

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
      expect(successful_search_page.not_correct_currency?('грн')).to be false
    end

    it "verify change currency into dolar" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.currency_change_dolar
      expect(successful_search_page.not_correct_currency?('$')).to be false
    end

    it "verify change currency into dolar" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.currency_change_euro
      expect(successful_search_page.not_correct_currency?('€')).to be false
    end

    it "verify change currency into dolar" do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.currency_change_hryvnia
      expect(successful_search_page.not_correct_currency?('грн')).to be false
    end

  end
end
