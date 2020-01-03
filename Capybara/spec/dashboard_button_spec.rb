require_relative '../all_requires.rb'

describe 'When testing demo.opensourcecms website' do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
      login_page = LoginPage.new
      login_page.load
      home_page = login_page.log_in('opensourcecms', 'opensourcecms')
    end
  end

  it 'Verify buttons are clickable' do
    home_page.get_main_page_buttons.each do |button|
      if button.visible?
        expect(home_page.find_button(button.text).click).not_to raise_error
      end
    end
  end

end
