require 'rubygems'
require_relative '../tools/all_requires'

describe "Add observed items tests" do
  context "When testing olx.ua " do
    it "Login as user " do
      $current_page = HomePage.new
      $current_page.start_test()
      $current_page = $current_page.top_login_button_click()
      $current_page = $current_page.loging($fb_account)
      expect($current_page).to be_a(UserPage)
      expect($current_page.user_page_loaded?).to be true
    end
    it "find iPhone in Home page" do
      $current_page = $current_page.home_button_click()
      $current_page.home_search_field_input($searh_successfu_item.searchItem)
      $current_page = $current_page.make_success_home_search()
      expect($current_page.correct_search?($searh_successfu_item.searchItem)).to be true
    end

    it "add result of search to 'Observed'. " do
      $current_page.save_search_top_button_click()
      $current_page = $current_page.top_login_for_loggined_click()
      $current_page.observed_search_link_click()
      expect($current_page.get_observed_item()).to eq $searh_successfu_item.searchItem
      $current_page.clear_observed_click()
    end

    after(:all) do
      driver_close()
    end

  end
end
