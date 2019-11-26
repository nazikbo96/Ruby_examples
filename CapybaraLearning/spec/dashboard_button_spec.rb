require_relative '../all_requires.rb'

describe 'When testing demo.opensourcecms website' do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
    end
  end

  it 'Verify logging' do
    login_page.load
    home_page = login_page.log_in('opensourcecms', 'opensourcecms')
    expect(home_page.loggined?).to be true
  end

  it 'Verify buttons are clickable' do
    home_page.get_main_page_buttons.each do |button|
      if button.visible?
        home_page.find_button(button.text).click
      end
    end
  end
  
end
