require 'rubygems'
require_relative '../tools/all_requires'

describe "Searching tests" do
  context "When testing olx.ua " do
    it "verify opening olx home page, making unsuccessful search" do
      current_page = HomePage.new
      current_page.start_test()
      current_page.home_search_field_input($searh_unsuccessful_item.searchItem)
      current_page = current_page.make_unsuccess_home_search()
      expect(current_page.search_unsuccess?()).to be true
    end

    it "verify opening olx home page, making successful search " do
      current_page = HomePage.new
      current_page.start_test()
      current_page.home_search_field_input($searh_successfu_item.searchItem)
      current_page = current_page.make_success_home_search()
      expect(current_page.correct_search?($searh_successfu_item.searchItem)).to be true
    end

    it "verify opening olx home page, making top search" do
      current_page = SuccessfulSearchPage.new
      current_page.make_top_search($top_search_item)
      expect(current_page.correct_search?($top_search_item.searchItem)).to be true
    end

    after(:all) do
      driver_close()
    end

  end
end
