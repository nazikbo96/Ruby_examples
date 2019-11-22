require 'rubygems'
require 'capybara'
require 'capybara/poltergeist'

describe 'Searching with only delivery tests' do

    Capybara.default_driver = :poltergeist
    browser = Capybara.current_session
    browser.visit 'http://rubymonstas.org'
    puts browser.html
    it 'verify opening olx home page, making successful search' do

    browser.visit 'https://www.olx.ua'
    browser.click_on 'Мой профиль'
    puts browser.text
    expect(browser.text.empty?).to be false

  end
end
