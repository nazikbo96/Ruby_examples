require 'rubygems'
require_relative '../tools/all_requires'

describe 'Register tests' do

    let(:fb_account) { User.new('nazar-y96@ukr.net','123546') }

    context 'When testing olx.ua' do

      before(:all) do
        start_test('https://www.olx.ua/')
      end

      it 'verify user can registrate new account' do
        home_page = HomePage.new
        register_page = home_page.top_login_button_click
        register_page.registration(fb_account)
      end

  end
end
