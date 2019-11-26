require_relative '../all_requires.rb'

describe 'When testing demo.opensourcecms website' do
  let(:count_of_ref) { 43 }
  let(:count_of_buttons) { 7 }
  let(:count_of_headings) { 12 }
  let(:count_of_inputs) { 2 }
  let(:count_of_text) { 43 }
  let(:dashboard_headings) {['Dashboard', 'Welcome to WordPress!', 'At a Glance', 'Activity', 'Quick Draft',
      'WordPress Events and News', 'Get Started', 'Next Steps', 'More Actions',
      'Recently Published', 'Recent Comments', 'View more comments' ]}
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

  it 'Verify count of links on dashbord page' do
    expect(home_page.get_main_page_ref.count).to eq count_of_ref
  end

  it 'Verify count of bunnons on dashbord page' do
    expect(home_page.get_main_page_buttons.count).to eq count_of_buttons
  end

  it 'Verify count of headings on dashbord page' do
    expect(home_page.get_main_page_headings.count).to eq count_of_headings
  end

  it 'Verify text of headings on dashbord page' do
    expect(home_page.correct_headings?(dashboard_headings)).to be true
  end

  it 'Verify count of input on dashbord page' do
    expect(home_page.get_main_page_input.count).to eq count_of_inputs
  end

  it 'Verify count of text on dashbord page' do
    expect(home_page.get_main_page_text.count).to eq count_of_text
  end

end
