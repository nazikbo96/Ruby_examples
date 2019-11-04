require 'rubygems'
require_relative '../tools/all_requires'

describe "Add observed items tests" do
  let( :fb_account ) { User.new("nazar-y96@ukr.net","123546") }
  let( :top_search ) { SearchItem.new("MacBook") }
  let( :web_site   ) { "https://www.olx.ua/" }

  context "When testing olx.ua " do

    after(:all) do
      driver_close
    end

    it "Login as user " do
      home_page = HomePage.new
      start_test(web_site)
      login_page = home_page.top_login_button_click
      user_page = login_page.loging(fb_account)
      expect(user_page).to be_a(UserPage)
      expect(user_page.user_page_loaded?).to be true
    end

    it "find MacBook in Home page" do
      user_page = UserPage.new
      home_page = user_page.home_button_click
      home_page.home_search_field_input(top_search.searchItem)
      successful_search_page = home_page.make_home_search
      expect(successful_search_page.not_correct_search?(top_search.searchItem)).to be false
    end

    it "add result of search to 'Observed and delete them'. " do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.save_search_top_button_click
      user_page = successful_search_page.top_login_for_loggined_click
      user_page.observed_search_link_click
      expect(user_page.get_observed_item_text).to eq top_search.searchItem
      user_page.clear_observed_click
    end

  end
end
