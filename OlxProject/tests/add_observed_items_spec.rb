require 'rubygems'
require_relative '../tools/all_requires'

describe "Add observed items tests" do
  let(:fb_account) {User.new("nazar-y96@ukr.net","123546")}
  let(:top_search) {SearchItem.new("MacBook")}

  context "When testing olx.ua " do

    after(:all) do
      driver_close
    end

    it "Login as user " do
      current_page = HomePage.new
      start_test
      current_page = current_page.top_login_button_click
      current_page = current_page.loging(fb_account)
      expect(current_page).to be_a(UserPage)
      expect(current_page.user_page_loaded?).to be true
    end

    it "find MacBook in Home page" do
      current_page = UserPage.new
      current_page = current_page.home_button_click
      current_page.home_search_field_input(top_search.searchItem)
      current_page = current_page.make_success_home_search
      expect(current_page.not_correct_search?(top_search.searchItem)).to be false
    end

    it "add result of search to 'Observed'. " do
      current_page = SuccessfulSearchPage.new
      current_page.save_search_top_button_click
      current_page = current_page.top_login_for_loggined_click
      current_page.observed_search_link_click
      expect(current_page.get_observed_item_text).to eq top_search.searchItem
      current_page.clear_observed_click
    end

  end
end
