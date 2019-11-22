require_relative '../all_requires.rb'
require_relative 'menu_part'

module DashbordPart SitePrism::Page
  def get_main_page_ref
    all(:xpath, "//div[contains(@id,'wpbody-content')]//a")
  end

  def get_main_page_buttons
    all(:css, 'button')
  end

  def get_main_page_headings
    headings = Array.new
    all(:css, 'h1').each {|h| headings << h}
    all(:css, 'h2').each {|h| headings << h}
    all(:css, 'h3').each {|h| headings << h}
  end

  def get_main_page_input
    all(:css, 'input')
  end

  def get_main_page_text
    all(:xpath, "//div[contains(@id,'wpbody-content')]//div[contains(text(),'')]")
  end

end



describe 'When testing demo.opensourcecms website' do
  let(:count_of_ref) { 41 }
  let(:count_of_buttons) { 9 }
  let(:count_of_headings) { 6 }
  let(:count_of_inputs) { 2 }
  let(:count_of_text) { 47 }

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
    end
      @login_page = LoginPage.new
      @home_page = HomePage.new
  end

  it 'Verify navigating to the login page' do
    @login_page.load
  end

  it 'Verify loggining' do
    @home_page = @login_page.log_in('opensourcecms', 'opensourcecms')
    expect(@home_page.loggined?).to be true
  end

  it 'Verify count of links on dashbord page' do
    expect(@home_page.get_main_page_ref.count).to eq count_of_ref
  end

  it 'Verify count of bunnons on dashbord page' do
    expect(@home_page.get_main_page_buttons.count).to eq count_of_buttons
  end

  it 'Verify count of headings on dashbord page' do
    expect(@home_page.get_main_page_headings.count).to eq count_of_headings
  end

  it 'Verify count of input on dashbord page' do
    expect(@home_page.get_main_page_input.count).to eq count_of_inputs
  end

  it 'Verify count of text on dashbord page' do
    expect(@home_page.get_main_page_text.count).to eq count_of_text
  end

end
