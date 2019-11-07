require 'rubygems'
require_relative '../tools/all_requires'

describe 'Searching tests' do

  let(:unsuccessful_search) { SearchItem.new('qweqwe') }
  let(:home_search) { SearchItem.new('MacBook') }
  let(:top_search) { TopSearchItem.new('MacBook','Львовская область') }
  let(:bad_top_search) { TopSearchItem.new('Mac_Book','Львовская область') }

  context 'When testing olx.ua' do

    it 'verify opening olx home page, making unsuccessful search' do
      home_page = HomePage.new
      start_test('https://www.olx.ua/')
      home_page.home_search_field_input(unsuccessful_search.searchItem)
      unsuccessful_search_page = home_page.make_home_search
      expect(unsuccessful_search_page.search_unsuccess?).to be true
    end

    it 'verify opening olx home page, making successful search' do
      home_page = HomePage.new
      start_test('https://www.olx.ua/')
      home_page.home_search_field_input(home_search.searchItem)
      successful_search_page = home_page.make_home_search
      expect(successful_search_page.not_correct_search?(home_search.searchItem)).to be false
    end

    it 'verify making top search' do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.make_top_search(top_search)
      expect(successful_search_page.not_correct_search?(top_search.searchItem)).to be false
      successful_search_page.make_top_search(bad_top_search)
      expect(successful_search_page.not_correct_search?(bad_top_search.searchItem)).to be true
    end

  end
end
