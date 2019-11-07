require 'rubygems'
require_relative '../tools/all_requires'

describe 'Currency change tests' do

  let(:home_search) { SearchItem.new('MacBook') }
  let(:currency) { {dolar: '$', euro: '€', hryvnia: 'грн.' } }

  context 'When testing olx.ua' do

    before(:all) do
      start_test('https://www.olx.ua/')
    end

    it 'verify opening olx home page, making successful search ' do
      home_page = HomePage.new
      home_page.home_search_field_input(home_search.searchItem)
      successful_search_page = home_page.make_home_search
      expect(successful_search_page.not_correct_search?(home_search.searchItem)).to be false
      expect(successful_search_page.not_correct_currency?(currency[:hryvnia])).to be false
    end

    it 'verify change currency into dolar' do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.change_currency_to(currency[:dolar])
      expect(successful_search_page.not_correct_currency?(currency[:dolar])).to be false
    end

    it 'verify change currency into euro' do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.change_currency_to(currency[:euro])
      expect(successful_search_page.not_correct_currency?(currency[:euro])).to be false
    end

    it 'verify change currency into hryvnia' do
      successful_search_page = SuccessfulSearchPage.new
      successful_search_page.change_currency_to(currency[:hryvnia])
      expect(successful_search_page.not_correct_currency?(currency[:hryvnia])).to be false
    end

  end
end
