require 'rubygems'
require_relative '../tools/all_requires'

describe "Searching tests" do

  let(:unsuccessful_search) {SearchItem.new("qweqwe")}
  let(:home_search) {SearchItem.new("MacBook")}
  let(:top_search) {TopSearchItem.new("MacBook","Львовская область")}
  let(:bad_top_search) {TopSearchItem.new("Mac_Book","Львовская область")}

  after(:all) do
    driver_close
  end

  context "When testing olx.ua " do
    it "verify opening olx home page, making unsuccessful search" do
      current_page = HomePage.new
      start_test
      current_page.home_search_field_input(unsuccessful_search.searchItem)
      current_page = current_page.make_unsuccess_home_search
      expect(current_page.search_unsuccess?).to be true
    end

    it "verify opening olx home page, making successful search " do
      current_page = HomePage.new
      start_test
      current_page.home_search_field_input(home_search.searchItem)
      current_page = current_page.make_success_home_search
      expect(current_page.not_correct_search?(home_search.searchItem)).to be false
      expect(current_page.not_correct_search?(bad_top_search.searchItem)).to be true
    end

    it "verify making top search" do
      current_page = SuccessfulSearchPage.new
      current_page.make_top_search(top_search)
      expect(current_page.not_correct_search?(top_search.searchItem)).to be false
      expect(current_page.not_correct_search?(bad_top_search.searchItem)).to be true
    end

  end
end
